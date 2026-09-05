{
  den,
  inputs,
  ...
}:
let
  inherit (den.lib.policy) route;
in
{
  imports = [ inputs.treefmt-nix.flakeModule ];

  # Hook the treefmt class into the flake-parts class so `nix fmt` works.
  den.classes.treefmt = { };

  den.policies.treefmt-to-flake-parts = _: [
    (route {
      fromClass = "treefmt";
      intoClass = "flake-parts";
      path = [ "treefmt" ];
      adaptArgs = { config, ... }: config.allModuleArgs;
    })
  ];

  den.schema.flake-parts.includes = [
    den.policies.treefmt-to-flake-parts
    den.aspects.coding.lsp
  ];
}
