{ stdenv, fetchurl, autoPatchelfHook,
zlib,
gtk2,
}:

let
          name = "xtrkcad";
        version = "5.3.1";

  installerFile = fetchurl {
          url = "https://downloads.sourceforge.net/project/xtrkcad-fork/XTrackCad/Version%205.3.1/xtrkcad-setup-5.3.1GA-1.x86_64.sh?ts=gAAAAABpOIABCfkytFfAvBdSQ1REP-Fap_LG9tdL9v32G22XgBWo-_mdXnghqvlnoeXw74WPI79pLUGEDKsXhPvEog1n0lc2Zg%3D%3D&r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Fxtrkcad-fork%2Ffiles%2FXTrackCad%2FVersion%25205.3.1%2Fxtrkcad-setup-5.3.1GA-1.x86_64.sh%2Fdownload";
          hash = "sha256-ltSiCJXYVUS0UiYDDs6ueW7UgULU7LRrvNfmppA22UQ=";
        };

in 

stdenv.mkDerivation {
        inherit name version installerFile;

        nativeBuildInputs = [
          autoPatchelfHook
        ];

        buildInputs = [
          zlib
          gtk2
        ];

        src = installerFile;
        unpackPhase = ''

        '';

        installPhase = ''
mkdir -p $out

$SHELL ${installerFile} --skip-license --prefix=$out
        '';
      }

