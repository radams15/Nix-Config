{pkgs, ...}: {
  mktemplate = pkgs.callPackage ./mktemplate { };
  lepton-firefox-theme = pkgs.callPackage ./lepton-firefox-theme.nix { };
  xtrkcad = pkgs.callPackage ./xtrkcad { };
}
