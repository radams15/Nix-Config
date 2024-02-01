{ lib, stdenv, fetchFromGitHub, buildGoModule }:
let
  pname = "mktempslate";
  version = "1.1.0";
in
   buildGoModule {
    inherit pname version;
    vendorHash = null;

    src = fetchFromGitHub {
      owner = "radams15";
      repo = "template";
      rev = "v${version}";
      sha256 = "sha256-1HNZTbr4OPaf8cPoYiZVDH0uLM7dv5zDXRfOwmQdGYU=";
    };

    meta = with lib; {
      description = "Simple template initialiser.";
      homepage = "https://github.com/radams15/template";
      license = licenses.mit;
    };
  }
