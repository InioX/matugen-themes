<svg xmlns="http://www.w3.org/2000/svg" height="16" width="12" viewBox="0 0 384 512"><!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.--><path opacity="1" fill="#ffffff" d="M162.4 6c-1.5-3.6-5-6-8.9-6h-19c-3.9 0-7.5 2.4-8.9 6L104.9 57.7c-3.2 8-14.6 8-17.8 0L66.4 6c-1.5-3.6-5-6-8.9-6H48C21.5 0 0 21.5 0 48V224v22.4V256H9.6 374.4 384v-9.6V224 48c0-26.5-21.5-48-48-48H230.5c-3.9 0-7.5 2.4-8.9 6L200.9 57.7c-3.2 8-14.6 8-17.8 0L162.4 6zM0 288v32c0 35.3 28.7 64 64 64h64v64c0 35.3 28.7 64 64 64s64-28.7 64-64V384h64c35.3 0 64-28.7 64-64V288H0zM192 432a16 16 0 1 1 0 32 16 16 0 1 1 0-32z"/></svg>

<div align="center">
     <img src="https://github.com/InioX/matugen-themes/assets/81521595/5e0b21af-62da-44ad-9492-f25689b260d9" width=15% height=15%>
     <br><br>
     <img src="https://github.com/InioX/matugen-themes/assets/81521595/3a7e0748-68d9-4227-9263-568fafe14f76" width=50% height=50%>
     <br><br>
     <img alt="size" src="https://custom-icon-badges.demolab.com/github/repo-size/InioX/matugen-themes?color=3D3838&logo=file&style=for-the-badge&logoColor=370D10&labelColor=FEB3B3">
     <img alt="stars" src="https://custom-icon-badges.demolab.com/github/stars/InioX/matugen-themes?color=3D3838&logo=star&style=for-the-badge&logoColor=370D10&labelColor=FEB3B3">
     <br>
     <a href="#-------------------------description">Description</a>
    ·
    <a href="#-------------------------installation">Installation</a>
    ·
    <a href="#-------------------------programs">Programs</a>
</div>

<div align="center">
  <img src="https://github.com/InioX/matugen/assets/81521595/9008d8d9-0157-4b38-9500-597986a2cb9f">
</div>

#### List of all templates
- [Alacritty](#alacritty)
- [Btop](#btop)
- [Cava](#cava)
- [Cosmic](#cosmic)
- [Dunst](#dunst)
- [Fuzzel](#fuzzel)
- [Ghostty](#ghostty)
- [GTK (3.0, 4.0)](#gtk)
- [Helix](#helix)
- [Hyprland & Hyprlock](#hyprland)
- [Kitty](#kitty)
- [Kvantum](#kvantum)
- [Mako](#mako)
- [MangoWC](#mangowc)
- [Micro](#micro)
- [Midnight Discord](#midnight-discord)
- [Neovim](#neovim)
- [Niri](#niri)
- [Opencode](#opencode)
- [Pywalfox](#pywalfox)
- [Qt (qt5, qt6)](#qt)
- [Quickshell](#quickshell)
- [Rmpc](#rmpc)
- [Rofi](#rofi)
- [Spicetify Sleek (Spotify)](#spicetify-sleek)
- [Starship](#starship)
- [Sway](#sway)
- [Television](#television)
- [Tmux](#tmux)
- [Vivaldi](#vivaldi)
- [Waybar](#waybar)
- [WezTerm](#wezterm)
- [Wine](#wine)
- [Wlogout](#wlogout)
- [Yazi](#yazi)
- [Zathura](#zathura)
- [Zed](#zed)
- [Wofi](#wofi)
- [SwayNC](#swaync)

### Alacritty
```toml
[config]
# ...
[templates.alacritty]
input_path = 'path/to/template'
output_path = '~/.config/alacritty/colors.toml'
# ...
```
Then, add this line to your `~/.config/alacritty/alacritty.toml`

```toml
import = ["colors.toml"]
```

### Btop
```toml
[config]
# ...
[templates.btop]
input_path = 'path/to/template'
output_path = '~/.config/btop/themes/matugen.theme'
post_hook = 'pkill -USR2 btop || true'
# ...
```
Then, choose `matugen` theme from btop settings.

### Cava
```toml
[config]
# ...
[templates.cava]
input_path = '~/.config/matugen/templates/cava-colors.ini'
output_path = '~/.config/cava/themes/your-theme'
post_hook = 'pkill -USR1 cava'
# ...
```
Then, update the theme variable `theme = 'none'` in the cava configuration file `~/.config/cava/config` with the output_path filename:

```toml
theme = 'your-theme'
```

### Cosmic
```toml
[config]
# ...
[templates.cosmic]
input_path = './templates/cosmic_theme.ron'
output_path = '~/.config/matugen/themes/matugen_cosmic.theme.ron'
post_hook = "~/.config/matugen/templates/cosmic_postprocess.py ~/.config/matugen/themes/matugen_cosmic.theme.ron"
# ...
```
Then, in Cosmic Settings app, under Desktop -> Appearance, click import and select the theme located at `~/.config/matugen/themes/matugen_cosmic.theme.ron` It will build several config files derived from the matugen colors. Cosmic is new and still in development, so updates may break things throughout the beta. Opacity is not yet in the Cosmic gui, but you can set it in the matugen template file and the theme builder will apply it.

![Cosmic Screenshot](./cosmic-screenshot.png)

### Dunst
```toml
[config]
# ...
[templates.dunst]
input_path = 'path/to/template'
output_path = '~/.config/dunst/dunstrc'
post_hook = 'dunstctl reload'
# ...
```

### Fuzzel
```toml
[config]
# ...
[templates.fuzzel]
input_path = 'path/to/template'
output_path = '~/.config/fuzzel/colors.ini'
# ...
```
Then, add this line to the top of your `~/.config/fuzzel/fuzzel.ini` file:

```ini
[main]
include = "~/.config/fuzzel/colors.ini"
```

### Ghostty
```toml
[config]
# ...
[templates.ghostty]
input_path = 'path/to/template'
output_path = '~/.config/ghostty/themes/Matugen'
post_hook = 'pkill -SIGUSR2 ghostty'
# ...
```
Then, add this line to your `~/.config/ghostty/config`:

```ini
theme = "Matugen"  
```

### GTK
```toml
[config]
# ...
[templates.gtk3]
input_path = 'path/to/template'
output_path = '~/.config/gtk-3.0/colors.css'
post_hook = 'gsettings set org.gnome.desktop.interface gtk-theme ""; gsettings set org.gnome.desktop.interface gtk-theme adw-gtk3-{{mode}}'

[templates.gtk4]
input_path = 'path/to/template'
output_path = '~/.config/gtk-4.0/colors.css'
# ...
```
Then, add this line to the top of your `~/.config/gtk-3.0/gtk.css` and `~/.config/gtk-4.0/gtk.css`:

```css
@import 'colors.css';
```

### Helix
```toml
[config]
# ...
[templates.helix]
input_path = 'path/to/template'
output_path = '~/.config/helix/themes/matugen.toml'
# ...
```
Then, add this line to your `~/.config/helix/config.toml`:

```toml
theme = "matugen"
```

### Hyprland
```toml
[config]
# ...
[templates.hyprland]
input_path = 'path/to/template'
output_path = '~/.config/hypr/colors.conf'
# ...
```
Then, add this line to the top of your `~/.config/hypr/hyprland.conf` and/or `~/.config/hypr/hyprlock.conf` file:

```hyprlang
source = colors.conf
```

### Kitty
```toml
[config]
# ...
[templates.kitty]
input_path = 'path/to/template'
output_path = '~/.config/kitty/themes/Matugen.conf'
post_hook = "kitty +kitten themes --reload-in=all Matugen"
# ...
```

Then, you just need to apply the theme once. Run `kitten themes` and select Matugen under the User section, finally just set it to update your `kitty.conf`.

### Kvantum
```toml
[config]
# ...
[templates.kvantum_kvconfig]
input_path = './templates/kvantum-colors.kvconfig'
output_path = '~/.config/Kvantum/matugen/matugen.kvconfig'

[templates.kvantum_svg]
input_path = './templates/kvantum-colors.svg'
output_path = '~/.config/Kvantum/matugen/matugen.svg'
# ...
```
Then, add the following in your ` ~/.config/Kvantum/kvantum.kvconfig` file:

```kvconfig
[General]
theme=matugen
```

### Mako
```toml
[config]
# ...
[templates.mako]
input_path = 'path/to/template'
output_path = '~/.config/mako/mako-colors'
post_hook = 'makoctl reload'
# ...
```
Then, add this line to the bottom of your `~/.config/mako/config` file:

```ini
include=~/.config/mako/mako-colors
```

### MangoWC
```toml
[config]
# ...
[templates.mango]
input_path = 'path/to/template'
output_path = '~/.config/mango/colors.conf'
post_hook = 'mmsg -d reload_config' 
# ...
```
Then, add this line to your `~/.config/mango/config.conf` file:

```conf
source=~/.config/mango/colors.conf
```

### Micro
```toml
[config]
# ...
[templates.micro]
input_path = 'path/to/template'
output_path = '~/.config/micro/colorschemes/matugen.micro'
# ...
```

Then, prss `Ctrl+E` in micro editor and enter `set colorscheme matugen`

### Midnight Discord
```toml
[config]
# ...
[templates.vesktop]
input_path = 'path/to/template'
output_path = '~/.config/vesktop/themes/midnight-discord.css'
```

> [!NOTE]
> ``output_path`` may be different if you are using Flatpak version of Vesktop.

Then, activate the theme from vencord themes.

### Neovim

Styling Neovim with matugen is an involved process due to working with plugins and various highlight groups. For information on how to leverage plugins for doing the "heavy-lifting", see [here](./templates/neovim).

Alternatively, you can style Neovim through its configuration standard in `.vim` format.
```toml
[config]
# ...
[templates.nvim]
input_path = 'path/to/templates/nvim-colors.vim'
output_path = '~/.config/nvim/colors/matugen.vim'
post_hook = 'pkill -SIGUSR1 nvim'
```

Then, add the following lines to your `~/.config/nvim/init.vim` file:
```vimscript
colorscheme matugen
autocmd Signal SIGUSR1 colorscheme matugen
```

If you instead use an `init.lua` file at this position, use:
```lua
vim.cmd("colorscheme matugen")
vim.api.nvim_create_autocmd("Signal", {
    pattern = "SIGUSR1",
    command = "colorscheme matugen",
})
```

### Niri
```toml
[config]
# ...
[templates.niri]
input_path = 'path/to/templates/niri-colors.kdl'
output_path = '~/.config/niri/colors.kdl'
post_hook = 'niri msg action load-config-file'
# ...
```
Then, update your `~/.config/niri/config.kdl` file:

```kdl
layout {
    // other values

    focus-ring{
      off
    }

    background-color "transparent"
    border {
        width 3
    }
  shadow {} // border and shadow need to at least be initialized inorder to recieve the include values
}

include "./colors.kdl"
```

### OpenCode
```toml
[config]
# ...
[templates.opencode]
input_path = '~/.config/matugen/templates/opencode.json'
output_path = '~/.config/opencode/themes/matugen.json'
# ...
```
In OpenCode use '/theme', select matugen, exit and restart the app. Since options are all loaded into memory at runtime, there is no on-the-fly changes to the theme. 

### Pywalfox
```toml
[config]
# ...
[templates.pywalfox]
input_path = 'path/to/template'
output_path = '~/.cache/wal/colors.json'
post_hook = 'pywalfox update'
# ...
```

> [!NOTE]
> Add the [Pywalfox plugin](https://addons.mozilla.org/en-US/firefox/addon/pywalfox/) to firefox / thunderbird. <br>
> Dependencies: [pywalfox](https://github.com/frewacom/pywalfox) <br>

### Qt 
```toml
[config]
# ...
[templates.qt5ct]
input_path = 'path/to/template'
output_path = '~/.config/qt5ct/colors/matugen.conf'

[templates.qt6ct]
input_path = 'path/to/template'
output_path = '~/.config/qt6ct/colors/matugen.conf'
# ...
```
Then, add these two lines to the top of your `~/.config/qt5ct/qt5ct.conf` file:

```conf
[Appearance]
color_scheme_path=yourusername/.config/qt5ct/colors/matugen.conf
custom_palette=true
```

For another method, the output path needs to be `~/.local/share/color-schemes/` in order for qt*ct to be able to find the color sheme

```toml
[config]
# ...
[templates.color-scheme]
input_path = '~/.config/matugen/templates/Matugen.colors'
output_path = '~/.local/share/color-schemes/Matugen.colors'
# ...
```
Then, pick a style you would like to use like `kde` or `Darkly` and ajust the code below, adding those lines to the top of `~/.config/qt5ct/qt5ct.conf` and `~/.config/qt6ct/qt6ct.conf`:

```ini
color_scheme_path=~/.local/share/color-schemes/Matugen.colors
custom_palette=true
icon_theme=breeze
style=<Breeze or Darkly>
```

Finally, make sure you have this environment variable `QT_QPA_PLATFORMTHEME` set to `qt6ct`.

> [!Note]
> for the theme to work you need to install the following <br>
> Arch Linux (AUR):
> - `yay -S breeze-icons breeze-gtk qt6ct-kde qt5ct-kde` <br>

For a kde style look download the following packages (Arch):
```
pacman -S breeze breeze5
```

For a cleaner style download the following packages (Arch):
```
yay -S darkly-bin
```

### Quickshell
```toml
[config]
# ...
[templates.quickshell]
input_path = 'path/to/template'
output_path = '~/.config/quickshell/Colors.qml'
# ...
```
You can now add this to your quickshell shell.qml file

```qml
Colors{
    id: colors
}
```
You can then use colors anywhere in your config like this

```qml
color: colors.background
```

### Rmpc
```toml
[config]
# ...
[templates.rmpc]
input_path = 'path/to/template'
output_path = '~/.config/rmpc/themes/matugen.ron'
# ...
```
Then, edit your `~/.config/rmpc/config.ron` to switch to the matugen theme:

```ron
(
    ...
    theme: Some("matugen"),
    ...
)
```
> [!NOTE]
> See [nix-hm-example](./templates/rmpc/nix-hm-example/) for an example of how to use with Nix Home Manager.

### Rofi
```toml
[config]
# ...
[templates.rofi]
input_path = 'path/to/template'
output_path = '~/.config/rofi/colors.rasi'
# ...
```
Then, add this line to the top of your `~/.config/rofi/config.rasi` file:

```css
@import "colors.rasi"
```

You can now use all the color variables inside of the `config.rasi`, for example:
```css
* {
     background-color: @primary-container;
}
```

### Spicetify Sleek
```toml
[config]
# ...
[templates.spotify]
input_path = 'path/to/template'
output_path = '~/.config/spicetify/Themes/Sleek/color.ini'
post_hook = 'spicetify watch -s 2>&1 | sed "/Reloaded Spotify/q"'
# ...
```
Then, add this line to your `~/.config/spicetify/config-xpui.ini` file:

```ini
color_scheme = matugen
current_theme = Sleek
```
Then, download the Sleek theme from `spicetify-thems` github:

```bash
curl -L --create-dirs \
	-o ~/.config/spicetify/Themes/Sleek/user.css \
	https://raw.githubusercontent.com/spicetify/spicetify-themes/master/Sleek/user.css
```
Now, start spotify using spicetify command:

```bash
spicetify watch -s
```
> [!NOTE]
>> `spicetify watch -s` might fails to start flatpak version of spotify. In
>> that case uncomment the `post_hook` and start spotify using following command:
>>
>> ```bash
>> flatpak run com.spotify.Client  --remote-debugging-port=9222 --remote-allow-origins='*'
>> ```

### Starship
```toml
[config]
# ...
[templates.starship]
input_path = 'path/to/template'
output_path = '~/.config/starship.toml'
# ...
```

### Sway
```toml
[config]
# ...
[templates.sway]
input_path = 'path/to/template'
output_path = '~/.config/sway/colors.conf'
post_hook = 'swaymsg reload'
# ...
```
Then, add this line to your `~/.config/sway/config` file:

```conf
include colors.conf
```

### Television
```toml
[config]
# ...
[templates.television]
input_path = 'templates/television.toml'
output_path = '~/.config/television/themes/matugen.toml'
# ...
```
Then, add this line to the `ui` section of your `~/.config/television/config.toml` file:

```toml
[ui]
theme = "matugen"
```

### Tmux
```toml
[config]
# ...
[templates.tmux]
input_path = 'path/to/template'
output_path = '~/.config/tmux/generated.conf'
post_hook = 'tmux source-file ~/.config/tmux/generated.conf' 
# ...
```
1. Add a `tmux source-file <OUTPUT_PATH>` line at the end of your
   `~/.config/tmux/tmux.conf` (entrypoint or adjacent) to source matugen's
   generated colors upon every startup of `tmux`. If you don't do this, then
   all new instances of `tmux` will be unstyled until matugen runs.

2. Set reasonable defaults for all color variables set by matugen. Place these
   initial color definitions in your `~/.config/tmux/tmux.conf`, but **before
   you source matugen's generated file**. This ensures that `tmux` has default
   colors to use in the case where matugen's generated file does not exist.

Example `~/.config/tmux/tmux.conf`:

```conf
# Set color defaults
set -g status-bg                          "#130d07"
set -gq @thm_bar_bg                       "#130d07"

set -gq @thm_bg                           "#19120c"
set -gq @thm_fg                           "#eee0d5"
set -gq @thm_primary                      "#fcb974"
set -gq @thm_inverse_primary              "#855318"
set -gq @thm_surface_low                  "#211a14"
set -gq @thm_surface                      "#261e18"
set -gq @thm_surface_variant              "#302921"
set -gq @thm_outline                      "#50453a"
set -gq @thm_text_variant                 "#d5c3b5"

set -g status-style                       "bg=#{@thm_bg},fg=#{@thm_fg}"
set -g window-active-style                "bg=#{@thm_bg},fg=#{@thm_fg}"

# Source matugen after setting defaults
source-file ~/.config/tmux/generated.conf

# Style whatever you wish with the imported colors
# ...
```

### Vivaldi
```toml
[config]
# ...
[templates.vivaldi]
input_path = 'path/to/template'
output_path = 'path/to/vivaldi_css/vivaldi.css' 
# ...
```
1. In vivaldi://experiments, enable “Allow for using CSS modifications”.
2. In Settings > Appearance > Custom UI Modifications, select the folder where you’ll store matugen vivaldi.css output.
Note that you can store vivaldi.css anywhere in a separate folder.

### Waybar
```toml
[config]
# ...
[templates.waybar]
input_path = 'path/to/template'
output_path = '~/.config/waybar/colors.css'
post_hook = 'pkill -SIGUSR2 waybar'
# ...
```

Then, add this line to the top of your `~/.config/waybar/style.css` file:

```css
@import "colors.css";
```
You can now use all the color variables inside the file:

```css
* {
     background-color: @primary_container;
}
```

### WezTerm
```toml
[config]
# ...
[templates.wezterm]
input_path = 'path/to/template'
output_path = '~/.config/wezterm/colors/matugen_theme.toml'
post_hook = 'touch ~/.config/wezterm/wezterm.lua'
# ...
```
Then, add these lines to your `~/.config/wezterm/wezterm.lua` file:

```lua
local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.color_scheme = "matugen_theme"
```

### Wine
```toml
[config]
# ...
[templates.wine]
input_path = 'path/to/template'
output_path = '/tmp/wine.reg'
post_hook = 'wine regedit /tmp/wine.reg'
# ...
```
If you want to apply the theme to a specific Wine prefix, run:

```bash
WINEPREFIX=~/path/to/your/prefix matugen <your arguments>
```

### Wlogout
```toml
[config]
# ...
[templates.wlogout]
input_path = 'path/to/template'
output_path = '~/.config/wlogout/colors.css'
# ...
```
Then, add this line to the top of your `~/.config/wlogout/style.css` file:

```css
@import "colors.css";
```
You can now use all the color variables inside the file:

```css
* {
     background-color: @primary_container;
}
```

### Yazi
```toml
[config]
# ...
[templates.yazi]
input_path = 'path/to/template'
output_path = '~/.config/yazi/theme.toml'
# ...
```

### Zathura
```toml
[config]
# ...
[templates.zathura]
input_path = 'path/to/template'
output_path = '~/.config/zathura/zathurarc'
# ...
```
Then, if transparency is needed just change the alpha value in:

```
set default-bg              "{{colors.on_primary.default.rgba | set_alpha: 1.0}}"
set recolor-lightcolor      "{{colors.on_primary.default.rgba | set_alpha: 1.0}}"
```
Finally, to change the font family and size just write it to (or use a {{custom}} filter on your matugen `config.toml`):

```
set font "FiraCode Nerd Font 12"
```

### Zed
```toml
[config]
# ...
[templates.zed]
input_path = '~/.config/matugen/templates/zed-colors.json'
output_path = '~/.config/zed/themes/matugen.json'
# ...
```
Then, choose `Matugen Dark` or `Matugen Light` theme from Zed settings.

<h2 class="acknowledgements">
     <sub>
          <img  src="https://github.com/InioX/dotfiles/assets/81521595/353caef1-d2bd-4a10-a709-c64b35465e65"
           height="25"
           width="25">
     </sub>
     Acknowledgements
</h2>

[Heus-Sueh](https://github.com/Heus-Sueh)

### Wofi
Copy the `colors.css` to `~/.config/matugen`
Add to `config.toml`
```toml
[config]
# ...
[templates.wofi]
input_path = "./colors.css"
output_path = "~/.config/wofi/colors.css"
```
Then import the `colors.css` to `~/.config/wofi/style.css`:
```css
@import "colors.css";
```

### SwayNC
Copy the `colors.css` to `~/.config/matugen`
Add to `config.toml`:
```toml
[config]
# ...
[templates.swaync]
input_path = "./colors.css"
output_path = "~/.config/swaync/colors.css"
post_hook = "swaync-client -rs"
```
Then import the `colors.css` to `~/.config/swaync/style.css`:
```css
@import "colors.css";
```
