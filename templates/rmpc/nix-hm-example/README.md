# Example Nix Home Manager Module

This module includes matugen and configures rmpc and cava.

To use, import it in your `home.nix`:

```
    imports = [
        ./matugen
        ...
    ];
```

## How does it work?

The module:

- creates a `~/.config/matugen/config.toml` preset with templates for rmpc and cava.
This tells Matugen that when it runs, it should process the files in `./templates`
and store the results into the appropriate target directories.
- installs the `./templates/` folder and it contents at `~/.config/matugen/templates/`
- imports and enables Matugen

## Notes

- Rmpc needs to be enabled in your NixOS/Home Manager modules separately.
- `~/.config/rmpc/config.ron` needs to be edited to use the theme:
```
    theme: Some("matugen"),
```
- I am yet to figure out if there's a way to modularize the rmpc config, such
that the UI layout would not need to be altered just because the colors change.
As such, if the layout included here is not to your liking, you'd need to edit
`./templates/rmpc.ron` accodringly.
- In this theme, cava is embedded in rmpc. While rmpc allows us to set the bar
colors in three different ways (single, rows, gradient), `horizontal_gradient`
does not appear to be supported at the moment.
See [Cava/Theming](https://rmpc.mierak.dev/next/configuration/cava/#theming)
