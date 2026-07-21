{
  den.aspects.desktop.niri = {
    nixos = { pkgs, ... }: {
      environment.systemPackages = with pkgs; [
        xwayland-satellite
        brightnessctl
        nautilus
        evtest
      ];
      programs.niri.enable = true;

      # Point the portal to where NixOS collects .portal implementation files.
      # The portal reads $XDG_DESKTOP_PORTAL_DIR to find portal implementations.
      # NixOS already collects them into /run/current-system/sw/share/xdg-desktop-portal/portals/.
      environment.sessionVariables = {
        XDG_DESKTOP_PORTAL_DIR = "/run/current-system/sw/share/xdg-desktop-portal/portals";
      };
      programs.dconf = {
        enable = true;
        profiles.user.databases = [
          {
            settings."org/gnome/desktop/interface" = {
              color-scheme = "prefer-dark";
            };
          }
        ];
      };
      services.gvfs.enable = true;

      xdg.portal = {
        enable = true;

        extraPortals = with pkgs; [
          xdg-desktop-portal-gtk
          xdg-desktop-portal-gnome
          gnome-keyring
        ];
        config = {
          common = {
            default = "gnome;gtk;";
            "org.freedesktop.impl.portal.Access" = "gtk";
            "org.freedesktop.impl.portal.Notification" = "gtk";
            "org.freedesktop.impl.portal.Secret" = "gnome-keyring";
          };
        };
      };
    };

    hjem = {
      xdg.config.files = {
        "niri/config.kdl" = {
          type = "copy";
          source = ./niri-settings.kdl;
        };
      };
    };
  };
}
