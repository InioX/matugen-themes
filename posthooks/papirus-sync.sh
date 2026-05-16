#!/usr/bin/env bash

COLOR_FILE="$HOME/.cache/matugen/papirus-color"

if ! command -v papirus-folders &>/dev/null; then
    echo "papirus-folders not found. Install it first: https://github.com/PapirusDevelopmentTeam/papirus-folders"
    exit 1
fi

papirus_installed=false
for dir in \
    "/usr/share/icons/Papirus" \
    "/usr/share/icons/Papirus-Dark" \
    "$HOME/.local/share/icons/Papirus" \
    "$HOME/.icons/Papirus"; do
    if [ -d "$dir" ]; then
        papirus_installed=true
        break
    fi
done

if [ "$papirus_installed" = false ]; then
    echo "No Papirus icon theme directory found."
    exit 1
fi

if [ ! -f "$COLOR_FILE" ]; then
    echo "Color file not found at $COLOR_FILE"
    exit 1
fi

hex=$(sed 's/^current=//' "$COLOR_FILE" | tr -d '#' | tr -d '[:space:]' | tr '[:upper:]' '[:lower:]')

if [ -z "$hex" ] || [ ${#hex} -ne 6 ]; then
    echo "Invalid hex color in $COLOR_FILE"
    exit 1
fi

r=$((16#${hex:0:2}))
g=$((16#${hex:2:2}))
b=$((16#${hex:4:2}))

max_val=$r
[ "$g" -gt "$max_val" ] && max_val=$g
[ "$b" -gt "$max_val" ] && max_val=$b

min_val=$r
[ "$g" -lt "$min_val" ] && min_val=$g
[ "$b" -lt "$min_val" ] && min_val=$b

brightness=$max_val

if [ "$max_val" -eq 0 ]; then
    saturation=0
else
    saturation=$(( (max_val - min_val) * 100 / max_val ))
fi

determine_hue_color() {
    local r=$1 g=$2 b=$3 brightness=$4 use_pale=$5

    if [ "$b" -gt "$r" ] && [ "$b" -gt "$g" ]; then
        local r_ratio=0 g_ratio=0
        [ "$b" -gt 0 ] && r_ratio=$(( r * 100 / b ))
        [ "$b" -gt 0 ] && g_ratio=$(( g * 100 / b ))
        local rg_diff=$(( r > g ? r - g : g - r ))

        if [ "$r_ratio" -gt 70 ] && [ "$g_ratio" -gt 70 ]; then
            if [ "$rg_diff" -lt 15 ]; then
                echo "blue"
            elif [ "$r" -gt "$g" ]; then
                echo "violet"
            else
                echo "cyan"
            fi
        elif [ "$r_ratio" -gt 60 ] && [ "$r" -gt "$g" ]; then
            echo "violet"
        elif [ "$g_ratio" -gt 60 ] && [ "$g" -gt "$r" ]; then
            echo "cyan"
        else
            echo "blue"
        fi
    elif [ "$r" -gt "$g" ] && [ "$r" -gt "$b" ]; then
        if [ "$g" -gt $((b + 30)) ]; then
            local rg_ratio=0
            [ "$r" -gt 0 ] && rg_ratio=$(( g * 100 / r ))
            if [ "$use_pale" = true ]; then
                if [ "$rg_ratio" -gt 70 ] && [ "$brightness" -lt 220 ]; then
                    echo "palebrown"
                else
                    echo "paleorange"
                fi
            else
                if [ "$rg_ratio" -gt 70 ] && [ "$brightness" -lt 180 ]; then
                    echo "brown"
                else
                    echo "orange"
                fi
            fi
        elif [ "$b" -gt $((g + 20)) ]; then
            echo "pink"
        else
            if [ "$use_pale" = true ]; then
                echo "pink"
            else
                echo "red"
            fi
        fi
    elif [ "$g" -gt "$r" ] && [ "$g" -gt "$b" ]; then
        if [ "$r" -gt $((b + 30)) ]; then
            echo "yellow"
        else
            echo "green"
        fi
    else
        echo "grey"
    fi
}

if [ "$saturation" -lt 20 ]; then
    if [ "$brightness" -lt 85 ]; then
        color="black"
    elif [ "$brightness" -lt 170 ]; then
        color="grey"
    else
        color="white"
    fi
elif [ "$saturation" -lt 60 ] && [ "$brightness" -gt 180 ]; then
    color=$(determine_hue_color "$r" "$g" "$b" "$brightness" true)
else
    color=$(determine_hue_color "$r" "$g" "$b" "$brightness" false)
fi

echo "Source color: #$hex -> Papirus color: $color"
sudo -n papirus-folders -C "$color" -u
