{
  config,
  lib,
}: let
  contents =
    lib.pipe
    ../README.md
    [
      builtins.readFile
      # Splits the list into 2 parts:
      # One before this line and one after
      # NOTE: If you add an entry to the readme after this, please trim that line
      # and replace the string here
      (lib.splitString "- [Midnight-Discord](#midnight-discord)")
      # Gets that 2nd half
      lib.last
      # Next 2 lines remove the acknowledgements section
      (lib.splitString "That's it!")
      lib.head
      # Splits the string into a list of strings. Each string is the text
      # within a section(e.g., the details under '### Hyprland')
      (builtins.split "###[[:space:]]")
      (lib.filter (line: line != "\n\n" && line != []))

      # Removes trailing newlines
      (map (line: lib.head (builtins.match "(.*[^\n])\n*" line)))
      # Makes a types.listOf types.attrs that looks like
      # {
      #   name = "foo";
      #   value = {
      #     input_path = "bar"
      #     output_path = "baz";
      #     post_hook = "qux";
      #   };
      # }
      (map extractKeys)
      # Converts it into an attr set
      builtins.listToAttrs
      # Renames "hyprland" to "hypr" changes gtk-related things
      (attrs:
        attrs // {
          hypr = attrs.hyprland;
          gtk3 = attrs.gtk // {
            output_path = "${config.xdg.configHome}/gtk-3.0/colors.css";
            post_hook = lib.concatStringsSep "; " [
              "gsettings set org.gnome.desktop.interface gtk-theme ''"
              "gsettings set org.gnome.desktop.interface gtk-theme \"${
                if config.gtk.theme.name != null
                then config.gtk.theme.name
                else "Adwaita-{{mode}}"
              }\""
            ];
          };
          # The output_path for gtk4 doesn't need to be manually set since the
          # regex should capture it
          gtk4 = attrs.gtk;
        })
      # Removes unusable and unneeded entries
      (attrs:
        builtins.removeAttrs attrs [
          "hyprland"
          "hyprlock"
          "starship" # Unusable out of the box
          "gtk"
        ])
    ];
  extractKeys = section: let
    match = key: builtins.match ".*${key} = '([^']+)'.*" section;

    input_path =
      lib.pipe
      "input_path"
      [
        match
        builtins.head
        (lib.removePrefix ".")
        (path: ../. + path)
      ];
    output_path =
      builtins.replaceStrings
      ["~/.config"]
      ["${config.xdg.configHome}"]
      (builtins.head (match "output_path"));
    post_hook = match "post_hook";
  in {
    name = lib.toLower (builtins.head (builtins.match "([^\n]+).*" section));
    value =
      if post_hook == null
      then {inherit input_path output_path;}
      else {
        inherit input_path output_path;
        post_hook = builtins.head post_hook;
      };
  };
in
  contents
