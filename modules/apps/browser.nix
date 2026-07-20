{ inputs, ... }: {
  den.aspects.apps.browser = {
    nixos = {
      imports = [
        inputs.helium.nixosModules.default
      ];

      programs.helium.enable = true;
    };
  };
}
