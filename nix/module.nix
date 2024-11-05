{
  config,
  lib,
  ...
}: let
  inherit (config.programs.matugen-themes) presets;

  templateData = import ./parseReadme.nix {inherit config lib;};

  templates = builtins.listToAttrs (map (name: lib.nameValuePair name templateData.${name}) presets);
in {
  options.programs.matugen-themes.presets = with lib;
    mkOption {
      type = types.listOf (types.enum (builtins.attrNames templateData));
      default = [];
      description = "The themes to use";
    };
  config = lib.mkIf (presets != []) {
    programs.matugen.settings = {inherit templates;};
  };
}
