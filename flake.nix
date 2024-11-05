{
  description = "Presets for matugen";

  outputs = _: {
    homeManagerModules = rec {
      matugen-themes = import ./nix/module.nix;
      default = matugen-themes;
    };
  };
}
