{
  den.aspects.coding.agents = {
    nixos =
      { pkgs, ... }:
      {
        environment.systemPackages = with pkgs; [
          opencode
          bubblewrap
        ];
      };
  };
}
