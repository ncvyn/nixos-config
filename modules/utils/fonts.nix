{
  den.aspects.utils.fonts = {
    nixos =
      { pkgs, ... }:
      {
        fonts = {
          enableDefaultPackages = true;
          packages = with pkgs; [
            noto-fonts
            noto-fonts-cjk-sans
            noto-fonts-color-emoji
            maple-mono.NF
          ];
          fontconfig = {
            enable = true;
            defaultFonts = {
              serif = [ "Noto Serif" ];
              sansSerif = [
                "Noto Sans"
                "Noto Sans CJK JP"
              ];
              monospace = [ "Maple Mono NF" ];
            };
          };
        };
      };
  };
}
