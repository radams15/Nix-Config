{ lib, stdenv, fetchFromGitHub, buildGoModule }:
let
  pname = "mktempslate";
  version = "1.0.0";
in
   buildGoModule {
    inherit pname version;
    vendorHash = null;

    src = fetchFromGitHub {
      owner = "radams15";
      repo = "template";
      rev = "v${version}";
      sha256 = "sha256-AJazid887O/ReSFRG4O3i9s1kEbK2T/CaZLl4YbFTfE";
    };

    meta = with lib; {
      description = "Simple template initialiser.";
      homepage = "https://github.com/radams15/template";
      license = licenses.mit;
    };
  }
