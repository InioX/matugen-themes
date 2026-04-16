import json
from pathlib import Path

BASE = Path.home() / ".config/Code/User/settings.json"
COLORS_PATH = Path.home() / ".config/Code/User/vscode-colors.json"

try:
    # Handle empty or missing settings file
    if BASE.exists() and BASE.stat().st_size > 0:
        base = json.loads(BASE.read_text())
    else:
        base = {}

    colors_data = json.loads(COLORS_PATH.read_text())
    
    # Extract the actual colors (handles wrapped or raw Matugen output)
    new_colors = colors_data.get("workbench.colorCustomizations", colors_data)

    # POP the key: This checks if it exists AND removes it from its old spot
    existing_customs = base.pop("workbench.colorCustomizations", {})

    # Merge them
    existing_customs.update(new_colors)

    # Reconstruct: Colors FIRST, then the rest
    final_settings = {"workbench.colorCustomizations": existing_customs}
    final_settings.update(base)

    BASE.write_text(json.dumps(final_settings, indent=4))
    print("Successfully merged colors to the top.")

except json.JSONDecodeError as e:
    print(f"JSON Syntax Error: {e}")
    print("Check for trailing commas in your settings.json!")
except Exception as e:
    print(f"Error: {e}")