{ den, ... }:
{
  den.hosts.x86_64-linux.kompi = {
    users.nevan.classes = [ "hjem" ];
  };

  den.aspects.kompi = {
    includes = [
      den.batteries.hostname
      den.aspects.kompi.hardware
      den.aspects.utils.kompi
      den.aspects.apps.gaming
      den.aspects.apps.docker
      den.aspects.apps.winapps
      (den.batteries.unfree [
        "nvidia-x11"
        "nvidia-settings"
        "nvidia-persistenced"
        "steam"
        "steam-unwrapped"
      ])
    ];

    nixos = {
      boot.kernelModules = [ "ntsync" ];

      hardware = {
        keyboard.qmk.enable = true;
        nvidia = {
          modesetting.enable = true;
          open = true;
        };
      };

      services.xserver.videoDrivers = [ "nvidia" ];
    };
  };
}
