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
          bun
          typescript-language-server
          vscode-langservers-extracted

          # Python
          python315
          uv

          # Go
          go

          # C/C++
          gcc
          libclang
        ];
      };

    treefmt = {
      programs.nixfmt.enable = true;
      settings.on-unmatched = "warn";
    };
  };
}
