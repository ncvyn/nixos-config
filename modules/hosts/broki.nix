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
      (den.batteries.unfree [
        "steam"
        "steam-original"
        "steam-unwrapped"
        "steam-run"
      ])
    ];

    nixos = { pkgs, ... }: {
      # https://github.com/nixos/nixpkgs/issues/539365
      systemd.services.throttled.serviceConfig.Environment = [
        "PYTHONPATH=${pkgs.python313Packages.dbus-next}/lib/python3.13/site-packages"
      ];

      services = {
        thinkfan = {
          enable = true;

          levels = [
            [
              0
              0
              40
            ]
            [
              1
              38
              44
            ]
            [
              2
              43
              50
            ]
            [
              3
              48
              58
            ]
            [
              4
              56
              70
            ]
            [
              5
              68
              76
            ]
            [
              6
              74
              82
            ]
            [
              7
              80
              95
            ]
          ];

        };

        throttled = {
          enable = true;
          extraConfig = ''
            [GENERAL]
            # Enable or disable the script execution
            Enabled: True
            # SYSFS path for checking if the system is running on AC power
            Sysfs_Power_Path: /sys/class/power_supply/AC*/online
            # Auto reload config on changes
            Autoreload: True

            ## Settings to apply while connected to Battery power
            [BATTERY]
            # Update the registers every this many seconds
            Update_Rate_s: 30
            # Max package power for time window #1
            PL1_Tdp_W: 22
            # Time window #1 duration
            PL1_Duration_s: 28
            # Max package power for time window #2
            PL2_Tdp_W: 28
            # Time window #2 duration
            PL2_Duration_S: 0.002
            # Max allowed temperature before throttling
            Trip_Temp_C: 80
            # Set cTDP to normal=0, down=1 or up=2 (EXPERIMENTAL)
            cTDP: 0
            # Disable BDPROCHOT (EXPERIMENTAL)
            Disable_BDPROCHOT: False

            ## Settings to apply while connected to AC power
            [AC]
            # Update the registers every this many seconds
            Update_Rate_s: 5
            # Max package power for time window #1
            PL1_Tdp_W: 22
            # Time window #1 duration
            PL1_Duration_s: 28
            # Max package power for time window #2
            PL2_Tdp_W: 28
            # Time window #2 duration
            PL2_Duration_S: 0.002
            # Max allowed temperature before throttling
            Trip_Temp_C: 80
            # Set HWP energy performance hints to 'performance' on high load (EXPERIMENTAL)
            # Uncomment only if you really want to use it
            # HWP_Mode: False
            # Set cTDP to normal=0, down=1 or up=2 (EXPERIMENTAL)
            cTDP: 0
            # Disable BDPROCHOT (EXPERIMENTAL)
            Disable_BDPROCHOT: False

            # All voltage values are expressed in mV and *MUST* be negative (i.e. undervolt)!
            [UNDERVOLT.BATTERY]
            # CPU core voltage offset (mV)
            CORE: -80
            # Integrated GPU voltage offset (mV)
            GPU: -50
            # CPU cache voltage offset (mV)
            CACHE: -80
            # System Agent voltage offset (mV)
            UNCORE: -80
            # Analog I/O voltage offset (mV)
            ANALOGIO: 0

            # All voltage values are expressed in mV and *MUST* be negative (i.e. undervolt)!
            [UNDERVOLT.AC]
            # CPU core voltage offset (mV)
            CORE: -80
            # Integrated GPU voltage offset (mV)
            GPU: -50
            # CPU cache voltage offset (mV)
            CACHE: -80
            # System Agent voltage offset (mV)
            UNCORE: -80
            # Analog I/O voltage offset (mV)
            ANALOGIO: 0
          '';
        };
      };
    };
  };
}
