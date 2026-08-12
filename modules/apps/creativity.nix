{
  den.aspects.apps.creativity = {
    nixos =
      { pkgs, ... }:
      {
        environment.systemPackages = with pkgs; [
          audacity
          inkscape
        ];
      };
  };
}
