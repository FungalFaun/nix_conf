{ pkgs }:

pkgs.stdenv.mkDerivation {
  name = "gruvbox-gtk";

  src = pkgs.fetchFromGitHub {
    owner = "Fausto-Korpsvart";
    repo = "Gruvbox-GTK-Theme";
    rev = "d064cd480a1e4802851b35bf051e48c808802c2a";
    sha256 = "09i3nadf5fj8jd5zpwjq25wmh33ks6khzi260zs7b3yg2rnv7s1c";
  };

  installPhase = ''
    mkdir -p $out
    cp -R ./themes/src/* $out/
  '';
}
