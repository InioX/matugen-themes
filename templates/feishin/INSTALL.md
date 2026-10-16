### Feishin

Copy [`templates/feishin`](./templates/feishin) to your template location.

Then replace `path/to/template` with the path to your previously copied template files.

```toml
[config]

[templates.feishin-css]
input_path = 'path/to/template/matugen.css'
output_path = '~/.config/feishin/Themes/overrides/matugen.css'

[templates.feishin]
input_path = 'path/to/template/matugen.json'
output_path = '~/.config/feishin/Themes/matugen.json'

[templates.feishin-colorful]
input_path = 'path/to/template/matugen-colorful.json'
output_path = '~/.config/feishin/Themes/matugen-colorful.json'

```

Then, inside Feishin, go to Menu > Settings > Theme and select your preferred Matugen variant.
