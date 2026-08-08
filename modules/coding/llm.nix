{
  den.aspects.coding.llm = {
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
