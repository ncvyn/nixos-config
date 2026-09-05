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
          source = ./editors-zed-settings.json;
          permissions = "664";
        };
        "zed/keymap.json" = {
          type = "copy";
          source = ./editors-zed-keymap.json;
          permissions = "664";
        };
      };
    };
  };
}
