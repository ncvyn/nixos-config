{ inputs, ... }: {
  flake-file = {
    inputs = {
      noctalia = {
        url = "github:noctalia-dev/noctalia/cachix";
      };
      noctalia-greeter = {
        url = "github:noctalia-dev/noctalia-greeter";
        inputs.nixpkgs.follows = "nixpkgs";
      };
    };

    # https://docs.noctalia.dev/v5/getting-started/nixos/?section=binary-cache
    nixConfig = {
      extra-substituters = [ "https://noctalia.cachix.org" ];
      extra-trusted-public-keys = [
        "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
      ];
    };
  };

  den.aspects.desktop.noctalia = {
    nixos = { pkgs, ... }: {
      imports = [
        inputs.noctalia.nixosModules.default
        inputs.noctalia-greeter.nixosModules.default
      ];

      # https://docs.noctalia.dev/v5/templates/official/gtk-qt/?section=gtk-34-applications
      environment.systemPackages = with pkgs; [
        adw-gtk3
        adwaita-icon-theme
        nwg-look
      ];

      hardware.bluetooth.enable = true;
      services = {
        tuned.enable = true;
        upower.enable = true;
      };

      programs = {
        noctalia.enable = true;
        noctalia-greeter.enable = true;
      };
    };

    hjem = {
      xdg.config.files = {
        "noctalia/settings.toml" = {
          source = ./noctalia-settings.toml;
        };
      };
    };
  };
}
