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
          gh
        ];
        services.fwupd.enable = true;
      };
  };
}
