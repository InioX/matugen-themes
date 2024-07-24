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
- [Css](#css)
    - [Waybar](#waybar)
    - [Wlogout](#wlogout)
    - [Swaync](#swaync)
- [Kitty](#kitty)
- [GTK (3.0, 4.0)](#gtk)
- [Sway](#sway)
- [Rofi](#rofi)
- [Dunst](#dunst)
- [Qt (qt5, qt6)](#qt)
- [Alacritty](#alacritty)
- [Starship](#starship)
- [Bat](#bat)
- [Midnight-Discord](#midnight-discord)

### Hyprland
Copy the [hyprland-colors.conf]() template and add it to the matugen config.
```toml
[config]
# ...

[templates.hyprland]
input_path = 'path/to/template'
output_path = '~/.config/hypr/colors.conf'
```

Then, add this line to the top of your `~/.config/hypr/config.conf` file
```
source = ~/.config/hypr/colors.conf
```

The theme will now be applied after you reload hyprland.
> [!NOTE]
> To reload hyprland you can either quit the current session and enter it again, or you can run `hyprctl reload` which instantly reloads your config.

### Css
Use [colors.css]() file for 
- Waybar
- Wlogout
- Swaync

Don't forget to change `app-name`.
```toml
[config]
# ...

[templates.<app-name>]
input_path = 'path/to/template'
output_path = '~/.config/<app-name>/colors.css'
```

Then, add this line to the top of your `~/.config/<app-name>/style.css` file
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
Copy the [kitty-colors.conf]() template and add it to the matugen config.
```toml
[config]
# ...

[templates.kitty]
input_path = 'path/to/template'
output_path = '~/.config/kitty/colors.conf'
```

Then, add this line to the bottom of your `~/.config/kitty/kitty.conf`
```
include colors.conf
```

The theme will now be applied after you reload kitty.

### GTK
```toml
[config]
# ...

[templates.gtk3]
input_path = 'path/to/template'
output_path = '~/.config/gtk-3.0/colors.css'

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
```

Then, add this line to your `~/.config/sway/config`
```
include colors.conf
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
@import "colors.rasi";
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
```

### qt
Change `5` to `6` for qt6ct
```toml
[config]

[templates.qt5ct]
input_path = 'path/to/template'
output_path = '~/.config/qt5ct/colors/matugen.conf'
```
Then, add this two lines to the top of your `~/.config/qt5ct/qt5ct.conf`
```
[Appearance]
color_scheme_path=yourusername/.config/qt5ct/colors/matugen.conf
custom_palette=true
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
That's it!


### Bat
```toml
[config]

[templates.bat]
input_path = 'path/to/template'
output_path = '~/.config/bat/themes/matugen.tmTheme'
```
> [!NOTE]
> Everytime the file changes, you'll need to run `bat cache --build"`.


### Midnight-Discord
This is a adaptation of [midnight-discord](https://github.com/refact0r/midnight-discord) theme.
Installation depends on your discord client. For [vesktop](https://github.com/Vencord/Vesktop) use this.

```toml
[config]

[templates.midnight-discord]
input_path = 'path/to/template'
output_path = '~/.config/vesktop/themes/midnight-matugen.css'}
```
Then on vesktop settings, select the theme.


<h2 class="acknowledgements">
     <sub>
          <img  src="https://github.com/InioX/dotfiles/assets/81521595/353caef1-d2bd-4a10-a709-c64b35465e65"
           height="25"
           width="25">
     </sub>
     Acknowledgements
</h2>

[Heus-Sueh](https://github.com/Heus-Sueh)
