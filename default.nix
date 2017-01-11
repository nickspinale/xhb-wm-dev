import <nixpkgs> {
  config = { pkgs }: {
    haskellPackageOverrides = self: super: with pkgs.haskell.lib; {
      xhb = appendPatch super.xhb ./xhb.patch;

      xhb-requests = self.callPackage ../xhb-requests/xhb-requests.nix {};
      xhb-requests-src = self.callPackage ../xhb-requests/xhb-requests-src.nix {};
      xhb-requests-build-utils = self.callPackage ../xhb-requests/build-utils {};

      xhb-keysyms = self.callPackage ../xhb-keysyms/xhb-keysyms.nix {};
      xhb-keysyms-src = self.callPackage ../xhb-keysyms/xhb-keysyms-src.nix {};
      xhb-keysyms-build-utils = self.callPackage ../xhb-keysyms/build-utils {};

      xhb-monad = self.callPackage ../xhb-monad {};

      xhb-event-queue = self.callPackage ../xhb-event-queue {};
      xhb-mapping-state = self.callPackage ../xhb-mapping-state {};
    };
  };
}
