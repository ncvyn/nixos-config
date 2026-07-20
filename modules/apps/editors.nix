{
  den.aspects.apps.editors = {
    nixos =
      { pkgs, ... }:
      {
        environment.systemPackages = with pkgs; [
          zed-editor-fhs
        ];
      };

    hjem = {
      xdg.config.files = {
        "zed/settings.json" = {
          type = "copy";
          source = ./editors-zed.json;
        };
      };
    };
  };
}
