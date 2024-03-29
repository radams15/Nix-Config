# You can build them using 'nix build .#example'
{pkgs, ...}: {
  mktemplate = pkgs.callPackage ./mktemplate { };
  ppcross8086 = pkgs.callPackage ./ppcross8086 { };
  ida-free = pkgs.callPackage ./ida-free { };
  binaryninja = pkgs.callPackage ./binaryninja { };

  lepton-firefox-theme = pkgs.callPackage ./lepton-firefox-theme.nix { };
}
