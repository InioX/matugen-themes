{inputs, config, ...}:
let
  cfgdir = "${config.home.homeDirectory}/.config";
in {
  # Make sure to include matugen in your flake.nix inputs:
  # ```nix
  #  {
  #    ...
  #    inputs = {
  #      ...
  #      matugen.url = "github:/InioX/Matugen";
  #    };
  #    ...
  #  }
  # ```
  imports = [
    inputs.matugen.nixosModules.default
  ];

  home.file."matugen/templates" = {
    source = ./templates;
    target = "${cfgdir}/matugen/templates";
    recursive = true;
  };

  home.file.".config/matugen/config.toml".text = ''
[config]

[templates.cava]
input_path = '${./templates/cava.ini}'
output_path = '${cfgdir}/cava/themes/matugen.ini'
post_hook = 'pkill -USR1 cava'

[templates.rmpc]
input_path = '${./templates/rmpc.ron}'
output_path = '${cfgdir}/rmpc/themes/matugen.ron'
  '';

  programs.matugen.enable = true;
}
