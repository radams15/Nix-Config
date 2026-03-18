{ config, lib, pkgs, modulesPath, ... }:

{
  services.autofs = {
    enable = true;
    autoMaster = let
      mapConf = pkgs.writeText "auto" ''
          share   10.0.0.2:/mnt/share
      '';
    in ''
      +auto.master
      /mnt ${mapConf}'';
  };
}
