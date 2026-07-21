{ inputs, ... }: {
  flake-file = {
    inputs = {
      winapps = {
        url = "github:winapps-org/winapps";
        inputs.nixpkgs.follows = "nixpkgs";
      };
    };
  };

  den.aspects.apps.winapps = {
    nixos =
      {
        pkgs,
        system ? pkgs.system,
        ...
      }:
      {
        environment.systemPackages = [
          inputs.winapps.packages."${system}".winapps
        ];
      };
  };
}
