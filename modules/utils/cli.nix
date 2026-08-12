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
          nixfmt-tree
        ];
        services.fwupd.enable = true;
      };
  };
}
