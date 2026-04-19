#!/usr/bin/env python3
"""
Shared HCT harmonization utilities for matugen scripts.

Provides color conversion helpers, HCT-based harmonization, and a
convenience pipeline that reads a matugen-generated colors JSON and
a base 16-color palette, then returns a fully harmonized palette.

Usage from sibling scripts:
    import sys, os
    sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
    from harmonizer import harmonize_from_matugen
"""

import json
import os

from materialyoucolor.hct import Hct
from materialyoucolor.utils.color_utils import rgba_from_argb, argb_from_rgb
from materialyoucolor.utils.math_utils import (
    difference_degrees,
    rotation_direction,
    sanitize_degrees_double,
)

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
DEFAULT_PALETTE = os.path.join(SCRIPT_DIR, "base-palette.json")


# ── Color conversion ──────────────────────────────────────────────────


def hex_to_rgb(h):
    h = h.lstrip("#")
    return (int(h[0:2], 16), int(h[2:4], 16), int(h[4:6], 16))


def rgb_to_hex(r, g, b):
    return "#{:02X}{:02X}{:02X}".format(r, g, b)


def hex_to_argb(h):
    r, g, b = hex_to_rgb(h)
    return argb_from_rgb(r, g, b)


def argb_to_hex(argb):
    rgba = rgba_from_argb(argb)
    return "#{:02X}{:02X}{:02X}".format(round(rgba[0]), round(rgba[1]), round(rgba[2]))


def hex_to_rgb_spec(h):
    r, g, b = hex_to_rgb(h)
    return f"rgb:{r:02x}/{g:02x}/{b:02x}"


def luminance(h):
    r, g, b = hex_to_rgb(h)
    return 0.2126 * r + 0.7152 * g + 0.0722 * b


# ── HCT harmonization ─────────────────────────────────────────────────


def harmonize(design_argb, source_argb, threshold, harmony):
    from_hct = Hct.from_int(design_argb)
    to_hct = Hct.from_int(source_argb)
    diff = difference_degrees(from_hct.hue, to_hct.hue)
    rot = min(diff * harmony, threshold)
    out_hue = sanitize_degrees_double(
        from_hct.hue + rot * rotation_direction(from_hct.hue, to_hct.hue)
    )
    return Hct.from_hct(out_hue, from_hct.chroma, from_hct.tone).to_int()


def boost_tone(argb, factor):
    hct = Hct.from_int(argb)
    new_tone = max(2, min(98, hct.tone * factor))
    return Hct.from_hct(hct.hue, hct.chroma, new_tone).to_int()


def harmonize_palette(base, primary_hex, harmony, threshold, fg_boost, is_dark):
    primary_argb = hex_to_argb(primary_hex)
    colors = {}
    for name, hex_val in base.items():
        h = harmonize(hex_to_argb(hex_val), primary_argb, threshold, harmony)
        if name != "term0":
            direction = 1 if is_dark else -1
            h = boost_tone(h, 1 + (fg_boost * direction))
        colors[name] = argb_to_hex(h)
    return colors


# ── Convenience pipeline ──────────────────────────────────────────────


def harmonize_from_matugen(
    colors_path,
    palette_path=None,
    harmony=0.8,
    harmonize_threshold=100,
    fg_boost=0.35,
):
    """Load matugen colors + base palette, harmonize, return results.

    Returns:
        (term, mc, mode, accent)
        - term:  dict of harmonized term0..termN hex colors
        - mc:    raw matugen colors dict
        - mode:  "dark" or "light"
        - accent: hex string of the source/accent color
    """
    palette_path = palette_path or DEFAULT_PALETTE

    with open(colors_path) as f:
        mc = json.load(f)

    with open(palette_path) as f:
        palette = json.load(f)

    is_dark = luminance(mc.get("background", "#000000")) < 128
    mode = "dark" if is_dark else "light"
    base = palette[mode]

    accent = mc.get("source_color") or mc.get("primary", "#888888")

    term = harmonize_palette(
        base, accent, harmony, harmonize_threshold, fg_boost, is_dark
    )

    return term, mc, mode, accent
