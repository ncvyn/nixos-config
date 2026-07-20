{
  den.aspects.apps.terminal = {
    nixos =
      { pkgs, ... }:
      {
        environment.systemPackages = with pkgs; [ foot ];
      };

    hjem =
      {
        xdg.config.files = {
          "foot/foot.ini" = {
            source = ./terminal-foot.ini;
          };
        };
      };
  };
}
