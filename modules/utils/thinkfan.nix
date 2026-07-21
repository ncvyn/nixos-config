{
  den.aspects.utils.thinkfan = {
    nixos = {
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
      };
    };
  };
}
