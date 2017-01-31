(import <nixpkgs> {
  config = { pkgs }: {
    haskellPackageOverrides = self: super: with pkgs.haskell.lib; with self; {

      xhb = appendPatch super.xhb ./xhb.patch;
      xhb-atom-cache = doJailbreak super.xhb-atom-cache;

      xhb-requests = callPackage ../xhb-requests/xhb-requests.nix {};
      xhb-requests-src = callPackage ../xhb-requests/xhb-requests-src.nix {};
      xhb-requests-build-utils = callPackage ../xhb-requests/build-utils {};

      xhb-keysyms = callPackage ../xhb-keysyms/xhb-keysyms.nix {};
      xhb-keysyms-src = callPackage ../xhb-keysyms/xhb-keysyms-src.nix {};
      xhb-keysyms-build-utils = callPackage ../xhb-keysyms/build-utils {};

      xhb-monad = callPackage ../xhb-monad {};

      xhb-event-queue = callPackage ../xhb-event-queue {};
      xhb-mapping-state = callPackage ../xhb-mapping-state {};

      tinywm = callPackage ../tinywm {};

      wmonad = dontHaddock (dontCheck (callPackage ../wmonad {}));

    };
  };
}).haskellPackages
