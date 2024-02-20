{ stdenv, fetchurl, undmg, cpio, xar, lib }:
let
  pname = "ppcross8086";
  version = "3.2.2";
in
   stdenv.mkDerivation rec {
    inherit pname version;
    vendorHash = null;

    src = fetchurl {
      url = "http://downloads.freepascal.org/fpc/dist/3.2.2/i8086-msdos/fpc-3.2.2.x86_64-linux.cross.i8086-msdos.tar.xz";
      sha256 = "sha256-/aiPOVSJk9+bc0URCmuQ571kAY5CwatRcj+hZwW39nE=";
    };

    builder = ./binary-builder.sh;

    meta = with lib; {
      description = "FPC compiler for i8086 MS-DOS";
      homepage = "https://www.freepascal.org/down/i8086/msdos-hungary.html";
    };
  }
