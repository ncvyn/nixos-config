{
  den.aspects.coding.lsp = {
    nixos =
      { pkgs, ... }:
      {
        environment.systemPackages = with pkgs; [
          # Nix
          nil
          nixd
          nixfmt

          # JS/TS
          nodejs
          pnpm
          typescript-language-server
          vscode-langservers-extracted

          # Python
          uv

          # Go
          go

          # C/C++
          gcc
        ];
      };
  };
}
