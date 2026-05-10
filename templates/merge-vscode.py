import json
import re
from pathlib import Path

BASE = Path.home() / ".config/Code/User/settings.json"
COLORS_PATH = Path.home() / ".config/Code/User/code-colors.jsonc"

# uncomment for VS-Codium

# BASE = Path.home() / ".config/VSCodium/User/settings.json"
# COLORS_PATH = Path.home() / ".config/Code/User/code-colors.jsonc"

def strip_jsonc(text):
    # Remove /* ... */ block comments
    text = re.sub(r"/\*.*?\*/", "", text, flags=re.DOTALL)
    # Remove // line comments (but not URLs like https://)
    text = re.sub(r'(?<!:)//.*', "", text)
    return text

try:
    if BASE.exists() and BASE.stat().st_size > 0:
        base = json.loads(BASE.read_text())
    else:
        base = {}

    colors_data = json.loads(strip_jsonc(COLORS_PATH.read_text()))

    new_colors = colors_data.get("workbench.colorCustomizations", colors_data)

    existing_customs = base.pop("workbench.colorCustomizations", {})
    existing_customs.update(new_colors)

    final_settings = {"workbench.colorCustomizations": existing_customs}
    final_settings.update(base)

    BASE.write_text(json.dumps(final_settings, indent=4))
    print("Successfully merged colors to the top.")

except json.JSONDecodeError as e:
    print(f"JSON Syntax Error: {e}")
    print("Check for trailing commas in your settings.json!")
except Exception as e:
    print(f"Error: {e}")
