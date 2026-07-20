{
  den.default = {
    nixos =
      { pkgs, ... }:
      {
        nix.settings = {
          experimental-features = [
            "nix-command"
            "flakes"
          ];
          trusted-users = [
            "root"
            "@wheel"
          ];
        };

        boot.loader.systemd-boot.enable = true;
        boot.loader.efi.canTouchEfiVariables = true;

        boot.kernelPackages = pkgs.linuxPackages_latest;

        networking.networkmanager.enable = true;

        time.timeZone = "Asia/Manila";

        environment.systemPackages = with pkgs; [
          git
          curl
          wget
        ];

        services = {
          printing.enable = true;

          pipewire = {
            enable = true;
            pulse.enable = true;
          };

          flatpak.enable = true;

          # Enable touchpad support
          libinput.enable = true;
        };

        hardware.graphics.enable = true;

        programs.gnupg.agent = {
          enable = true;
          enableSSHSupport = true;
        };

        system.stateVersion = "25.05";
      };

    hjem.clobberFiles = true;
  };
}
