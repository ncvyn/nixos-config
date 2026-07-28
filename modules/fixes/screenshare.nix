{
  den.aspects.fixes.screenshare = {
    # [NOTE] This aspect fixes the portal screencast backends for screen sharing on niri.
    # I have problems with screencasting on niri and this aspect fixes said problems.

    nixos = { pkgs, ... }: {
      # Point the portal to where NixOS collects .portal implementation files.
      environment.sessionVariables = {
        XDG_DESKTOP_PORTAL_DIR = "/run/current-system/sw/share/xdg-desktop-portal/portals";
      };

      # A oneshot systemd service to set the XDG_CURRENT_DESKTOP from the
      # default of "niri" to "niri:gnome" in the user session's environment.
      # This ensures xdg-desktop-portal sees "niri:gnome" and matches the
      # gnome.portal backend's UseIn=gnome.
      systemd.user.services.screenshare-env = {
        description = "Set XDG_CURRENT_DESKTOP=niri:gnome for portal screencast";
        wantedBy = [ "graphical-session.target" ];
        after = [
          "graphical-session-pre.target"
          "niri.service"
        ];
        before = [
          "xdg-desktop-portal.service"
          "xdg-desktop-portal-gnome.service"
        ];
        partOf = [ "graphical-session.target" ];
        serviceConfig = {
          Type = "oneshot";
          RemainAfterExit = true;
          ExecStart = "${pkgs.systemd}/bin/systemctl --user set-environment XDG_CURRENT_DESKTOP=niri:gnome";
        };
      };

      # Ensure the GNOME portal starts automatically.
      systemd.user.services.xdg-desktop-portal-gnome = {
        wantedBy = [ "graphical-session.target" ];
        after = [ "graphical-session.target" ];
      };
    };
  };
}
