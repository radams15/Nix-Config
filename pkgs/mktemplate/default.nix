{ lib, stdenv, fetchFromGitHub, buildGoModule }:
let
  pname = "mktemplate";
  version = "1.2.0";
in
   buildGoModule {
    inherit pname version;

    src = fetchFromGitHub {
      owner = "radams15";
      repo = "template";
      rev = "v${version}";
      sha256 = "sha256-oSlakVq+00mvJm4iffonaehXurdfY+AJtAdG1sJumSw=";
    };

    vendorHash = "sha256-3mUgR6TKTOz5TKLbZN9Sl0LECzK2f1p/JzX9Zd3q5sU=";

    meta = with lib; {
      description = "Simple template initialiser.";
      homepage = "https://github.com/radams15/template";
      license = licenses.mit;
    };
  }
