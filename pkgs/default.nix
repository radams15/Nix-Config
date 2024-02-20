# You can build them using 'nix build .#example'
{pkgs, ...}: {
  mktemplate = pkgs.callPackage ./mktemplate { };
  ppcross8086 = pkgs.callPackage ./ppcross8086 { };
}
