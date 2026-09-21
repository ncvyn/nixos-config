{
  den.aspects.fixes.xwayland-satellite = {
    # xwayland-satellite 0.8.2 regressed focus handling for override-redirect
    # popups (commit 3273a0f), closing Steam's menu popups instantly under niri.
    # Upstream fix is PR #494 (merge add2795), not yet in a release.
    # Drop this overlay once nixpkgs ships xwayland-satellite > 0.8.2.
    nixos =
      { ... }:
      {
        nixpkgs.overlays = [
          (
            final: prev:
            let
              src = prev.fetchFromGitHub {
                owner = "Supreeeme";
                repo = "xwayland-satellite";
                rev = "add2795134593faafce60e404a0a75df68e9ee0c";
                hash = "sha256-0TxfMgqW0/BLD4M942c5DCKYrtPvzsPJwvdcco4LQUM=";
              };
            in
            {
              xwayland-satellite = prev.xwayland-satellite.overrideAttrs (_: {
                version = "unstable-add2795";
                inherit src;
                cargoDeps = prev.rustPlatform.fetchCargoVendor {
                  pname = "xwayland-satellite";
                  version = "unstable-add2795";
                  inherit src;
                  hash = "sha256-s1gl9eR6Mt2QLrhfcowstPFjzwE/lz4PJhJzWYHoIHg=";
                };
              });
            }
          )
        ];
      };
  };
}
