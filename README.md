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
- [Qt (qt5, qt6)](#qt)
- [Alacritty](#alacritty)
- [Starship](#starship)
- [Midnight-Discord](#midnight-discord)

### Hyprland
Copy the [hyprland-colors.conf](./templates/hyprland-colors.conf) template to `$XDG_CONFIG_HOME/matugen/templates/`.
```toml
[config]
# ...

[templates.hyprland]
input_path = './templates/hyprland-colors.conf'
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
Hyprlock uses the same color format as Hyprland so we can use the same template. If you didn't use the template above, copy the [hyprland-colors.conf](./templates/hyprland-colors.conf) template to `$XDG_CONFIG_HOME/matugen/templates/`.
```toml
[config]
# ...

[templates.hyprlock]
input_path = './templates/hyprland-colors.conf'
output_path = '~/.config/hypr/colors.conf'
```

Then, add this line to the top of your `~/.config/hypr/hyprlock.conf` file
```
source = colors.conf
```

Configuration example (`hyprlock.conf`):
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
Copy the [colors.css](./templates/colors.css) template to `$XDG_CONFIG_HOME/matugen/templates/`.
```toml
[config]
# ...

[templates.waybar]
input_path = './templates/colors.css'
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
Copy the [kitty-colors.conf](./templates/kitty-colors.conf) template to `$XDG_CONFIG_HOME/matugen/templates/`.
```toml
[config]
# ...

[templates.kitty]
input_path = './templates/kitty-colors.conf'
output_path = '~/.config/kitty/colors.conf'
```

Then, add this line to the bottom of your `~/.config/kitty/kitty.conf`
```
include colors.conf
```

The theme will now be applied after you reload kitty.

### GTK
Copy the [gtk-colors.css](./templates/gtk-colors.css) template to `$XDG_CONFIG_HOME/matugen/templates/`.
```toml
[config]
# ...

[templates.gtk3]
input_path = './templates/gtk-colors.css'
output_path = '~/.config/gtk-3.0/colors.css'

[templates.gtk4]
input_path = './templates/gtk-colors.css'
output_path = '~/.config/gtk-4.0/colors.css'
```

Then, add this line to the top of `~/.config/gtk-3.0/gtk.css` and `~/.config/gtk-4.0/gtk.css`
```css
@import 'colors.css';
```

### Sway
Copy the [sway-colors.conf](./templates/sway-colors.conf) template to `$XDG_CONFIG_HOME/matugen/templates/`.
```toml
[config]
# ...

[templates.sway]
input_path = './templates/sway-colors.conf'
output_path = '~/.config/sway/colors.conf'
post_hook = 'swaymsg reload'
```

Then, add this line to your `~/.config/sway/config`
```
include colors.conf
```

### wlogout
Copy the [colors.css](./templates/colors.css) template to `$XDG_CONFIG_HOME/matugen/templates/`.
```toml
[config]
# ...

[templates.wlogout]
input_path = './templates/colors.css'
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
Copy the [rofi-colors.rasi](./templates/rofi-colors.rasi) template to `$XDG_CONFIG_HOME/matugen/templates/`.
```toml
[config]

[templates.rofi]
input_path = './templates/rofi-colors.rasi'
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
Copy the [dunstrc-colors](./templates/dunstrc-colors) template to `$XDG_CONFIG_HOME/matugen/templates/`.
```toml
[config]

[templates.dunst]
input_path = './templates/dunstrc-colors'
output_path = '~/.config/dunst/dunstrc'
```

### qt
Copy the [qtct-colors](./templates/qtct-colors) template to `$XDG_CONFIG_HOME/matugen/templates/`.
Change `5` to `6` for qt6ct
```toml
[config]

[templates.qt5ct]
input_path = './templates/qtct-colors.conf'
output_path = '~/.config/qt5ct/colors/matugen.conf'
```
Then, add these two lines to the top of your `~/.config/qt5ct/qt5ct.conf`
```
[Appearance]
color_scheme_path=yourusername/.config/qt5ct/colors/matugen.conf
custom_palette=true
```

### Alacritty
Copy the [alacritty.toml](./templates/alacritty.toml) template to `$XDG_CONFIG_HOME/matugen/templates/`.
```toml
[config]

[templates.alacritty]
input_path = './templates/alacritty.toml'
output_path = '~/.config/alacritty/colors.toml'
```
Then, add this line to your `~/.config/alacritty/alacritty.toml`
```
import = ["colors.toml"]
```

### Starship
Copy the [starship-colors.toml](./templates/starship-colors.toml) template to `$XDG_CONFIG_HOME/matugen/templates/`(with your own modifications).
```toml
[config]

[templates.starship]
input_path = './templates/starship-colors.toml'
output_path = '~/.config/starship.toml'
```
> [!WARNING]
> This will overwrite `~/.config/starship.toml.` Please modify the template to your liking before adding it to your matugen configuration

That's it!


<h2 class="acknowledgements">
    <sub>
        <img src="https://github.com/InioX/dotfiles/assets/81521595/353caef1-d2bd-4a10-a709-c64b35465e65"
        height="25"
        width="25">
    </sub>
    Acknowledgements
</h2>

[Heus-Sueh](https://github.com/Heus-Sueh)
