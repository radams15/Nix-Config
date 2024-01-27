# You can build them using 'nix build .#example'
{pkgs, ...}: {
  mktemplate = pkgs.callPackage ./mktemplate { };
}
