import os
import subprocess
import sys

# Resolve relative to this file's location so it works regardless of
# where the user's matugen config directory is (e.g. ~/.config/matugen
# on Unix, %APPDATA%\InioX\matugen\config on Windows).
script_dir = os.path.dirname(os.path.abspath(__file__))
home = os.path.expanduser("~")
script = os.path.join(script_dir, "generate-term-colors.py")
colors = os.path.join(home, ".cache", "matugen", "term-colors.json")

subprocess.run([sys.executable, script, "--colors", colors, "--apply"], check=True)
