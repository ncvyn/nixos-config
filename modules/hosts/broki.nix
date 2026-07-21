{ den, ... }:
{
  den.hosts.x86_64-linux.broki = {
    users.nevan.classes = [ "hjem" ];
  };

  den.aspects.broki = {
    includes = [
      den.batteries.hostname
      den.aspects.broki.hardware
      den.aspects.apps.gaming
      den.aspects.utils.thinkfan
      den.aspects.utils.throttled
      (den.batteries.unfree [
        "steam"
        "steam-original"
        "steam-unwrapped"
        "steam-run"
      ])
    ];
  };
}
