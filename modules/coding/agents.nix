{
  den.aspects.coding.agents = {
    nixos =
      { pkgs, ... }:
      {
        environment.systemPackages = with pkgs; [
          omp
          bubblewrap
        ];
      };
  };
}
