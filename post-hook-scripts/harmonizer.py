#!/usr/bin/env python3
"""Shared HCT harmonization utilities for matugen scripts."""

import json

from materialyoucolor.hct import Hct
from materialyoucolor.utils.color_utils import rgba_from_argb, argb_from_rgb
from materialyoucolor.utils.math_utils import (
    difference_degrees,
    rotation_direction,
    sanitize_degrees_double,
)

DEFAULT_PALETTE = {
    "dark": {
        "term0":  "#282828",
        "term1":  "#CC241D",
        "term2":  "#98971A",
        "term3":  "#D79921",
        "term4":  "#458588",
        "term5":  "#B16286",
        "term6":  "#689D6A",
        "term7":  "#A89984",
        "term8":  "#928374",
        "term9":  "#FB4934",
        "term10": "#B8BB26",
        "term11": "#FABD2F",
        "term12": "#83A598",
        "term13": "#D3869B",
        "term14": "#8EC07C",
        "term15": "#EBDBB2",
        "term16": "#D65D0E",
        "term17": "#A89984",
        "term18": "#D79921",
    },
    "light": {
        "term0":  "#FDF9F3",
        "term1":  "#FF6188",
        "term2":  "#A9DC76",
        "term3":  "#FC9867",
        "term4":  "#FFD866",
        "term5":  "#F47FD4",
        "term6":  "#78DCE8",
        "term7":  "#333034",
        "term8":  "#121212",
        "term9":  "#FF6188",
        "term10": "#A9DC76",
        "term11": "#FC9867",
        "term12": "#FFD866",
        "term13": "#F47FD4",
        "term14": "#78DCE8",
        "term15": "#333034",
        "term16": "#D65D0E",
        "term17": "#A89984",
        "term18": "#D79921",
    },
}


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


def harmonize(from_hct, to_hct, tone_boost, chroma_scale=1.0, strength=0.8):
    diff = difference_degrees(from_hct.hue, to_hct.hue)
    rot = diff * strength
    out_hue = sanitize_degrees_double(
        from_hct.hue + rot * rotation_direction(from_hct.hue, to_hct.hue)
    )
    out_chroma = from_hct.chroma * chroma_scale
    return Hct.from_hct(out_hue, out_chroma, from_hct.tone * (1 + tone_boost))


def harmonize_palette(base, primary_hex, is_dark, source_hex=None, strength=0.8):
    primary_hct = Hct.from_int(hex_to_argb(primary_hex))
    if source_hex:
        source_hct = Hct.from_int(hex_to_argb(source_hex))
        chroma_scale = min(primary_hct.chroma / max(source_hct.chroma, 1), 1.0)
    else:
        chroma_scale = 1.0
    colors = {}
    for name, hex_val in base.items():
        idx = int(name.replace("term", ""))
        from_hct = Hct.from_int(hex_to_argb(hex_val))
        if idx == 0:
            tone_boost = 0
        else:
            boost = 0.35 if idx < 8 else 0.20
            tone_boost = boost * (-1 if not is_dark else 1)
        h = harmonize(from_hct, primary_hct, tone_boost, chroma_scale, strength)
        colors[name] = argb_to_hex(h.to_int())
    return colors


def harmonize_from_matugen(colors_path, strength=0.8):
    """Load matugen colors and harmonize with built-in palette."""
    with open(colors_path) as f:
        mc = json.load(f)

    is_dark = luminance(mc.get("background", "#000000")) < 128
    mode = "dark" if is_dark else "light"
    base = DEFAULT_PALETTE[mode]

    primary = mc.get("primary") or mc.get("source_color", "#888888")
    source = mc.get("source_color")

    term = harmonize_palette(base, primary, is_dark, source, strength)

    return term, mc, mode, primary
