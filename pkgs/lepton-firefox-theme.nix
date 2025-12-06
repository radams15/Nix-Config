{ stdenv, fetchFromGitHub, fetchgit }:

stdenv.mkDerivation rec {
  name = "lepton-firefox-theme";

  gitRef = "6996841e86885d2d08a2bcbc62ee20d49f71437c";

  src = fetchGit {
    url = "https://github.com/black7375/Firefox-UI-Fix";
    ref = "photon-style";
    rev = "${gitRef}";
  };

  installPhase = ''
    cp -r . "$out"
  '';

  dontFixup = true;

  meta = {
    homepage = "https://github.com/black7375/Firefox-UI-Fix";
    description = "🦊 I respect proton UI and aim to improve it.";
  };
}
