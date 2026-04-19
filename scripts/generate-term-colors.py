#!/usr/bin/env python3
"""
Generate terminal colors from matugen output.

Reads matugen's generated colors JSON, harmonizes a base 16-color terminal
palette toward the wallpaper accent using HCT color space, then outputs
terminal theme files + live OSC injection to running terminals.

Terminals:
  Unix:  Kitty, Wezterm
  Win32: Windows Terminal, Wezterm

Usage (as matugen post_hook):
  python3 generate-term-colors.py --colors ~/.cache/matugen/term-colors.json --apply

Standalone:
  python3 generate-term-colors.py --colors term-colors.json --harmony 0.8 --print
"""

import argparse
import json
import os
import signal
import subprocess
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from harmonizer import (
    DEFAULT_PALETTE,
    hex_to_rgb_spec,
    harmonize_from_matugen,
)

IS_UNIX = sys.platform != "win32"
SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))

CACHE_DIR = os.path.expanduser("~/.cache/matugen")
KITTY_PATH = os.path.expanduser("~/.config/kitty/matugen.conf")
WEZTERM_PATH = os.path.expanduser("~/.config/wezterm/matugen.lua")
WINDOWS_TERM_SCHEME = os.path.join(CACHE_DIR, "windows_term.json")
WINDOWS_TERM_POST = os.path.join(SCRIPT_DIR, "windows_term_post.ps1")
SEQUENCES_PATH = os.path.join(CACHE_DIR, "sequences.txt")


# ── Terminal writers ───────────────────────────────────────────────────


def write_kitty(term, mc):
    os.makedirs(os.path.dirname(KITTY_PATH), exist_ok=True)
    with open(KITTY_PATH, "w") as f:
        f.write(f"background {term['term0']}\n")
        f.write(f"foreground {term['term7']}\n")
        f.write(f"cursor {term['term7']}\n")
        f.write(f"cursor_text_color {term['term0']}\n")
        f.write(
            f"selection_background {mc.get('on_secondary_container', term['term7'])}\n"
        )
        f.write(
            f"selection_foreground {mc.get('secondary_container', term['term0'])}\n"
        )
        for i in range(19):
            f.write(f"color{i} {term[f'term{i}']}\n")


def write_wezterm(term, mc):
    sel_bg = mc.get("on_secondary_container", term["term7"])
    sel_fg = mc.get("secondary_container", term["term0"])
    os.makedirs(os.path.dirname(WEZTERM_PATH), exist_ok=True)
    with open(WEZTERM_PATH, "w") as f:
        f.write("local colors = {\n")
        f.write(f'  foreground = "{term["term7"]}",\n')
        f.write(f'  background = "{term["term0"]}",\n')
        f.write(f'  cursor_bg = "{term["term7"]}",\n')
        f.write(f'  cursor_fg = "{term["term0"]}",\n')
        f.write(f'  selection_bg = "{sel_bg}",\n')
        f.write(f'  selection_fg = "{sel_fg}",\n')
        f.write("  ansi = {\n")
        for i in range(8):
            f.write(f'    "{term[f"term{i}"]}",\n')
        f.write("  },\n")
        f.write("  brights = {\n")
        for i in range(8, 16):
            f.write(f'    "{term[f"term{i}"]}",\n')
        f.write("  },\n")
        f.write("  indexed = {\n")
        for i in range(16, 19):
            f.write(f'    [{i}] = "{term[f"term{i}"]}",\n')
        f.write("  },\n")
        f.write("}\n")
        f.write("return colors\n")


def write_windows_terminal(term, mc):
    theme_name = "Matugen Colors"
    scheme = {
        "name": theme_name,
        "black": term["term0"],
        "red": term["term1"],
        "green": term["term2"],
        "yellow": term["term3"],
        "blue": term["term4"],
        "purple": term["term5"],
        "cyan": term["term6"],
        "white": term["term7"],
        "brightBlack": term["term8"],
        "brightRed": term["term9"],
        "brightGreen": term["term10"],
        "brightYellow": term["term11"],
        "brightBlue": term["term12"],
        "brightPurple": term["term13"],
        "brightCyan": term["term14"],
        "brightWhite": term["term15"],
        "background": term["term0"],
        "foreground": term["term7"],
        "selectionBackground": mc.get("primary", term["term7"]),
        "cursorColor": term["term7"],
    }
    os.makedirs(os.path.dirname(WINDOWS_TERM_SCHEME), exist_ok=True)
    with open(WINDOWS_TERM_SCHEME, "w") as f:
        json.dump(scheme, f, indent=4)
    subprocess.run(
        [
            "powershell",
            "-ExecutionPolicy",
            "Bypass",
            "-File",
            WINDOWS_TERM_POST,
            "-SchemePath",
            WINDOWS_TERM_SCHEME,
        ],
        check=True,
    )


# ── OSC live injection (Unix only) ────────────────────────────────────


def build_osc_sequences(term, num_colors=19):
    bg = hex_to_rgb_spec(term["term0"])
    fg = hex_to_rgb_spec(term["term7"])
    ESC = "\033"
    ST = "\033\\"
    seq = ""
    seq += f"{ESC}]10;{fg}{ST}"
    seq += f"{ESC}]11;{bg}{ST}"
    seq += f"{ESC}]12;{fg}{ST}"
    seq += f"{ESC}]17;{fg}{ST}"
    for i in range(num_colors):
        color = hex_to_rgb_spec(term[f"term{i}"])
        seq += f"{ESC}]4;{i};{color}{ST}"
    return seq


def write_sequences(seq):
    os.makedirs(os.path.dirname(SEQUENCES_PATH), exist_ok=True)
    with open(SEQUENCES_PATH, "w") as f:
        f.write(seq)


def apply_kitty_reload():
    try:
        pids = subprocess.check_output(["pgrep", "kitty"], text=True).strip().split()
        for pid in pids:
            try:
                os.kill(int(pid), signal.SIGUSR1)
            except (OSError, ProcessLookupError):
                pass
    except (subprocess.CalledProcessError, FileNotFoundError):
        pass


def reload_all_ptys(seq):
    import glob as _glob

    for tty in sorted(_glob.glob("/dev/pts/[0-9]*")):
        try:
            with open(tty, "w") as f:
                f.write(seq)
        except (OSError, PermissionError):
            pass


# ── Main ───────────────────────────────────────────────────────────────


def main():
    parser = argparse.ArgumentParser(
        description="Harmonize terminal colors from matugen output"
    )
    parser.add_argument(
        "--colors", required=True, help="Path to matugen-generated colors JSON"
    )
    parser.add_argument(
        "--palette", default=DEFAULT_PALETTE, help="Path to base palette JSON"
    )
    parser.add_argument(
        "--harmony", type=float, default=0.8, help="Hue shift strength 0-1"
    )
    parser.add_argument(
        "--harmonize-threshold",
        type=float,
        default=100,
        help="Max hue shift angle 0-180",
    )
    parser.add_argument(
        "--term-fg-boost", type=float, default=0.35, help="Contrast boost factor"
    )
    parser.add_argument(
        "--apply", action="store_true", help="Push colors to running terminals"
    )
    parser.add_argument("--print", action="store_true", help="Print harmonized colors")
    args = parser.parse_args()

    term, mc, mode, accent = harmonize_from_matugen(
        args.colors,
        args.palette,
        args.harmony,
        args.harmonize_threshold,
        args.term_fg_boost,
    )

    term["term0"] = mc.get("background", term["term0"])
    term["term7"] = mc.get("on_background", term["term7"])
    term["term8"] = mc.get("outline", term["term8"])
    term["term15"] = mc.get("on_surface", term["term15"])
    term["term16"] = mc.get("tertiary", term["term16"])
    term["term17"] = mc.get("on_secondary", term["term17"])
    term["term18"] = mc.get("secondary", term["term18"])

    if IS_UNIX:
        write_kitty(term, mc)

    write_wezterm(term, mc)

    if not IS_UNIX:
        write_windows_terminal(term, mc)

    if args.print:
        print(f"mode:    {mode}")
        print(f"accent:  {accent}")
        print()
        for name in sorted(term, key=lambda k: int(k.replace("term", ""))):
            print(f"  {name:8s} {term[name]}")
        print()
        if IS_UNIX:
            print(f"kitty:   {KITTY_PATH}")
        else:
            print(f"windows terminal: {WINDOWS_TERM_SCHEME}")
        print(f"wezterm: {WEZTERM_PATH}")

    if args.apply:
        seq = build_osc_sequences(term)
        write_sequences(seq)
        if IS_UNIX:
            apply_kitty_reload()
            reload_all_ptys(seq)
        if args.print:
            print(f"\nSequences written to {SEQUENCES_PATH}")
            if IS_UNIX:
                print("Apply with: cat ~/.cache/matugen/sequences.txt 2> /dev/null")
            else:
                print(
                    'Apply with: Get-Content "$env:USERPROFILE\\.cache\\matugen\\sequences.txt" 2>$null'
                )


if __name__ == "__main__":
    main()
