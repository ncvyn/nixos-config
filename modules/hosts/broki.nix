{ den, ... }:
{
  den.hosts.x86_64-linux.broki = {
    users.nevan.classes = [ "hjem" ];
  };

  den.aspects.broki = {
    includes = [
      den.batteries.hostname
      den.aspects.broki.hardware
      den.aspects.utils.broki
      den.aspects.apps.gaming
      (den.batteries.unfree [
        "steam"
        "steam-original"
        "steam-unwrapped"
        "steam-run"
      ])
    ];
  };
}
