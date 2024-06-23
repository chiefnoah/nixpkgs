{ callPackage, fetchFromGitHub, gambit-unstable, gambit-support, pkgs, gccStdenv }:

callPackage ./build.nix rec {
  version = "unstable-2024-06-22";
  git-version = "0.18.1";
  src = fetchFromGitHub {
    owner = "mighty-gerbils";
    repo = "gerbil";
    rev = "3a9fc86fce59f6a2ebd3e0ca2e6ddbb9acf43bf6";
    sha256 = "UoFAaRzaF+K7kizdha9dvjvrf1HTTq9RGvxcisQdN/k=";
    fetchSubmodules = true;
  };
  inherit gambit-support;
  gambit-params = gambit-support.unstable-params;
  # These are available in pkgs.gambit-unstable.passthru.git-version, etc.
  gambit-git-version = "4.9.5-78-g8b18ab69";
  gambit-stampYmd = "20231029";
  gambit-stampHms = "163035";
}
