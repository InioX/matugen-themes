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
- [Hyprland](#hyprland)
- [Hyprlock](#hyprlock)
- [Waybar](#waybar)
- [Kitty](#kitty)
- [GTK (3.0, 4.0)](#gtk)
- [Sway](#sway)
- [Wlogout](#wlogout)
- [Rofi](#rofi)
- [Dunst](#dunst)
- [Mako](#mako)
- [Qt (qt5, qt6)](#qt)
- [Qt-Method-2(qt5, qt6)](#qt-method-2)
- [Alacritty](#alacritty)
- [Starship](#starship)
- [Midnight Discord](#midnight-discord)
- [Pywalfox](#pywalfox)
- [Yazi](#yazi)
- [Zathura](#zathura)
- [Fuzzel](#fuzzel)
- [Television](#television)
- [Cava](#cava)
- [Helix](#helix)
- [Btop](#btop)
- [Micro](#micro)
- [Zed](#zed)
- [Neovim](#neovim)
- [Tmux](#tmux)
- [Ghostty](#ghostty)

### Hyprland
Copy the [hyprland-colors.conf]() template and add it to the matugen config.
```toml
[config]
# ...

[templates.hyprland]
input_path = 'path/to/template'
output_path = '~/.config/hypr/colors.conf'
post_hook = 'hyprctl reload'
```

Then, add this line to the top of your `~/.config/hypr/hyprland.conf` file
```
source = colors.conf
```

The theme will now be applied after you reload hyprland.
> [!NOTE]
> To reload hyprland you can either quit the current session and enter it again, or you can run `hyprctl reload` which instantly reloads your config.

### Hyprlock
Hyprlock uses the same color format as Hyprland so we can use `hyprland-colors.css`, if you didn't make the template above, Copy the [hyprland-colors.conf]() template and add it to the matugen config.
```toml
[config]
# ...

[templates.hyprland]
input_path = 'path/to/template'
output_path = '~/.config/hypr/colors.conf'
```

Then, add this line to the top of your `~/.config/hypr/hyprlock.conf` file
```
source = colors.conf
```

Configuration Example (`hyprlock.conf`):
```
source = colors.conf
background {
    path = $image  # This variable contains the image you selected with matugen
}

label {
    color = $primary
}
```

### Waybar
Copy the [colors.css](https://github.com/InioX/matugen-themes/blob/main/templates/colors.css) template and add it to the matugen config.
```toml
[config]
# ...

[templates.waybar]
input_path = 'path/to/template'
output_path = '~/.config/waybar/colors.css'
post_hook = 'pkill -SIGUSR2 waybar'
```

Then, add this line to the top of your `~/.config/waybar/style.css` file
```
@import "colors.css";
```

You can now use all the color variables inside the file.
```css
* {
     background-color: @primary_container;
}
```

### Kitty
Copy the [kitty-colors.conf](https://github.com/InioX/matugen-themes/blob/main/templates/kitty-colors.conf) template and add it to the matugen config.
```toml
[config]
# ...

[templates.kitty]
input_path = 'path/to/template'
output_path = '~/.config/kitty/colors.conf'
post_hook = 'pkill -SIGUSR1 kitty'
```

Then, add this line to the bottom of your `~/.config/kitty/kitty.conf`
```
include colors.conf
```

The theme will now be applied after you reload kitty.

To reload all the kitty instances automatically you can use kitty's own built-in theme manager through a kitten.
To accomplish this we need to set the output_path of `[templates.kitty]` to `~/.config/kitty/theme/your-theme.conf`

Then append ```[templates.kitty]``` with
```
post_hook = "kitty +kitten themes --reload-in=all your-theme"
```
[Kitty Themes Wiki](https://sw.kovidgoyal.net/kitty/kittens/themes/)

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
```

Then, add this line to the top of your `~/.config/gtk-3.0/gtk.css` and `~/.config/gtk-4.0/gtk.css`
```css
@import 'colors.css';
```

### Sway
```toml
[config]
# ...

[templates.sway]
input_path = 'path/to/template'
output_path = '~/.config/sway/colors.conf'
post_hook = 'swaymsg reload'
```

Then, add this line to your `~/.config/sway/config`
```
include colors.conf
```

### wlogout
```toml
[config]
# ...

[templates.wlogout]
input_path = 'path/to/template'
output_path = '~/.config/wlogout/colors.css'
```

Then, add this line to the top of your `~/.config/wlogout/style.css`
```
@import "colors.css";
```

You can now use all the color variables inside the file.
```css
* {
     background-color: @primary_container;
}
```

### Rofi
```toml
[config]

[templates.rofi]
input_path = 'path/to/template'
output_path = '~/.config/rofi/colors.rasi'
```

Then, add this line to the top of your `~/.config/rofi/config.rasi`
```
@import "colors.rasi"
```

You can now use all the color variables inside of the `config.rasi`.
```css
* {
     background-color: @primary-container;
}
```

### dunst
```toml
[config]

[templates.dunst]
input_path = 'path/to/template'
output_path = '~/.config/dunst/dunstrc'
post_hook = 'dunstctl reload'
```

### mako
```
[config]

[templates.mako]
input_path = 'path/to/template'
output_path = '~/.config/mako/mako-colors'
post_hook = 'makoctl reload'
```
Then, add this line to the bottom of your `~/.config/mako/config`
```
import=~/.config/mako/mako-colors
```

### qt
Change `5` to `6` for qt6ct
```toml
[config]

[templates.qt5ct]
input_path = 'path/to/template'
output_path = '~/.config/qt5ct/colors/matugen.conf'
```
Then, add these two lines to the top of your `~/.config/qt5ct/qt5ct.conf`
```
[Appearance]
color_scheme_path=yourusername/.config/qt5ct/colors/matugen.conf
custom_palette=true
```

### Qt-Method-2

Note: the output path needs to be `~/.local/share/color-schemes/` in order for qt*ct to be able to find the color sheme

```toml
[templates.color-scheme]
input_path = '~/.config/matugen/templates/Matugen.colors'
output_path = '~/.local/share/color-schemes/Matugen.colors'
```
Next, pick what style you would like to use `kde` or `Darkly` and ajust the code below.

Then, add these four lines to the top of `~/.config/qt5ct/qt5ct.conf` and do the same for qt6

```
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

For a kde style look download the following packages:

```
pacman -S breeze breeze5
```

For a cleaner style download the following packages:

```
yay -S darkly-qt5-git darkly-qt6-git
```

### Alacritty
```toml
[config]

[templates.alacritty]
input_path = 'path/to/template'
output_path = '~/.config/alacritty/colors.toml'
```
Then, add this line to your `~/.config/alacritty/alacritty.toml`
```
import = ["colors.toml"]
```

### Starship
```toml
[config]

[templates.starship]
input_path = 'path/to/template'
output_path = '~/.config/starship.toml'
```

### Midnight Discord

Copy the [midnight-discord.css](https://github.com/InioX/matugen-themes/blob/main/templates/midnight-discord.css) template and add it to the matugen config.

```toml
[config]

[templates.vesktop]
input_path = 'path/to/template'
output_path = '~/.config/vesktop/themes/midnight-discord.css'
```

> [!NOTE]
> ``output_path`` may be different if you are using Flatpak version of Vesktop.

Then, activate the theme from vencord themes.

### Pywalfox
```toml
[config]

[templates.pywalfox]
input_path = 'path/to/template'
output_path = '~/.cache/wal/colors.json'
post_hook = 'pywalfox update'
```

> [!NOTE]
> Add the [Pywalfox plugin](https://addons.mozilla.org/en-US/firefox/addon/pywalfox/) to firefox / thunderbird. <br>
> Dependencies: [pywalfox](https://github.com/frewacom/pywalfox) <br>
> Install:
> - Arch (AUR): `yay -S python-pywalfox`
> - GNU/Linux, MacOS, Windows: [Follow Instructions](https://github.com/frewacom/pywalfox?tab=readme-ov-file#-installation)


That's it!

### Yazi
```toml
[config]

[templates.yazi]
input_path = 'path/to/template'
output_path = '~/.config/yazi/theme.toml'
```
### Zathura
```toml
[config]

[templates.zathura]
input_path = 'path/to/template'
output_path = '~/.config/zathura/zathurarc'
```
Then, if transparency is needed just change the alpha value in:
```
set default-bg              "{{colors.on_primary.default.rgba | set_alpha: 1.0}}"
set recolor-lightcolor      "{{colors.on_primary.default.rgba | set_alpha: 1.0}}"
```
And to change the font family and size just write it to:
```
set font "FiraCode Nerd Font 12"
```

### Fuzzel
```toml
[config]

[templates.fuzzel]
input_path = 'path/to/template'
output_path = '~/.config/fuzzel/colors.ini'
```
Then, add this line to the top of your `~/.config/fuzzel/fuzzel.ini` file
```ini
[main]
include = "~/.config/fuzzel/colors.ini"
```

### Television
```toml
[config]

[templates.television]
input_path = 'templates/television.toml'
output_path = '~/.config/television/themes/matugen.toml'
```
Then, add this line to the `ui` section of your `~/.config/television/config.toml` file
```toml
[ui]
theme = "matugen"
```

### Cava
Copy the [cava-colors.ini](https://github.com/InioX/matugen-themes/blob/main/templates/cava-colors.ini) template and add it to the matugen config.
```toml
[config]
# ...

[templates.cava]
input_path = '~/.config/matugen/templates/cava-colors.ini'
output_path = '~/.config/cava/themes/your-theme'
post_hook = "pkill -USR1 cava"
```

Update the theme variable `theme = 'none'` in the cava configuration file `~/.config/cava/config` with the output_path filename.
```toml
theme = 'your-theme'
```
And that's it, by default the vertical gradient effect is activated, to disable it comment the line `gradient = 1` and uncomment `; gradient = 0` inside the `cava-colors.ini` template.
> [!NOTE]
>> Cava's current support for loading themes externally is only available in the git version, you will have to compile from source for it to work.

### Helix
```
[templates.helix]
input_path = 'path/to/template'
output_path = '~/.config/helix/themes/matugen.toml'
```

Then, add this line to your `~/.config/helix/config.toml`

```
theme = "matugen"
```

### Btop
```toml
[config]

[templates.btop]
input_path = 'path/to/template'
output_path = '~/.config/btop/themes/matugen.theme'
```
Then Choose `matugen` theme from btop settings.


### Micro
```toml
[config]

[templates.micro]
input_path = 'path/to/template'
output_path = '~/.config/micro/colorschemes/matugen.micro'
```

In micro editor, press `Ctrl+E` and then enter `set colorscheme matugen`

### Zed
```toml
[config]

[templates.zed]
input_path = '~/.config/matugen/templates/zed-colors.json'
output_path = '~/.config/zed/themes/matugen.json'
```
Then Choose `Matugen Dark` or `Matugen Light` theme from Zed settings.

### Tmux

Copy the [tmux-colors.conf](./templates/tmux-colors.conf) and add it to your matugen config.

```toml
[templates.tmux]
input_path = 'path/to/template'
output_path = '~/.config/tmux/generated.conf'
post_hook = 'tmux source-file ~/.config/tmux/generated.conf' 
```

Make sure you source the **output** of the template file, not the template file
itself!! Additionally, note the following:

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

### Neovim

Styling Neovim with matugen is an involved process due to working with plugins and various highlight groups. For further info, see [here](./templates/neovim).

### Ghostty
```toml
[config]

[templates.ghostty]
input_path = 'path/to/template'
output_path = '~/.config/ghostty/themes/Matugen'
post_hook = 'pkill -SIGUSR2 ghostty'
```
Then, add this line to your `~/.config/ghostty/config`
```
theme = "Matugen"  
```

<h2 class="acknowledgements">
     <sub>
          <img  src="https://github.com/InioX/dotfiles/assets/81521595/353caef1-d2bd-4a10-a709-c64b35465e65"
           height="25"
           width="25">
     </sub>
     Acknowledgements
</h2>
[Heus-Sueh](https://github.com/Heus-Sueh)
