{ inputs, ... }: {
  flake-file.inputs = {
    helium = {
      url = "github:oxcl/nix-flake-helium-browser";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  den.aspects.apps.browser = {
    nixos = {
      imports = [
        inputs.helium.nixosModules.default
      ];

      programs.helium.enable = true;
    };
  };
}
