with import ./.;

let
  
  this-ghc = haskellPackages.ghcWithPackages (hp: with hp; [
    xhb-requests
    xhb-monad
    xhb-keysyms
    xhb-mapping-state
    xhb-event-queue
  ]);

in stdenv.mkDerivation {
  name = "env";
  buildInputs = [
    this-ghc
  ];
}
