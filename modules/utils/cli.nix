{
  den.aspects.utils.cli = {
    nixos =
      { pkgs, ... }:
      {
        environment.systemPackages = with pkgs; [
          fastfetch-unwrapped
          ripgrep
          fzf
          btop
          acpi
        ];
        services.fwupd.enable = true;
      };
  };
}
