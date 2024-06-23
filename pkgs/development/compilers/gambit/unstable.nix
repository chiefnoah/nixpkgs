{ callPackage, fetchFromGitHub, gambit-support }:

callPackage ./build.nix rec {
  version = "unstable-2024-04-07";
  git-version = "4.9.5-130-09335d9";
  stampYmd = 20240407;
  stampHms = 204859;
  rev = "09335d95cab6931791c0a8497cbe915053ff8af3";
  src = fetchFromGitHub {
    owner = "gambit";
    repo = "gambit";
    inherit rev;
    sha256 = "6mzhc6HyHI7RUB/Z8M4+zXSJmvUwPzAXEtwKBA3Sr+A=";
  };
  gambit-params = gambit-support.unstable-params;
}
