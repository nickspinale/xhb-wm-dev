let

  nixpkgs = import <nixpkgs/pkgs/top-level> {
    system = builtins.currentSystem;
    config = {
      haskellPackageOverrides = self: super: with nixpkgs.haskell.lib; {
        xhb = appendPatch super.xhb ./xhb.patch;

        xhb-requests = self.callPackage ../xhb-requests/xhb-requests.nix {};
        xhb-requests-src = super.callPackage ../xhb-requests/xhb-requests-src.nix {};
        xhb-requests-build-utils = self.callPackage ../xhb-requests/build-utils {};

        xhb-monad = self.callPackage ../xhb-monad {};

        xhb-keysyms = self.callPackage ../xhb-keysyms/xhb-keysyms.nix {};
        xhb-keysyms-src = super.callPackage ../xhb-keysyms/xhb-keysyms-src.nix {};
        xhb-keysyms-build-utils = self.callPackage ../xhb-keysyms/build-utils {};

        xhb-mapping-state = self.callPackage ../xhb-mapping-state {};
      };
    };
  };

in with nixpkgs;

haskellPackages
