# You can build them using 'nix build .#example'
{pkgs, ...}: {
  mktemplate = pkgs.callPackage ./mktemplate { };
  lepton-firefox-theme = pkgs.callPackage ./lepton-firefox-theme.nix { };
}
