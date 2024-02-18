# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  fileSystems."/mnt/share" = {
    device = "server:/mnt/share";
    options = ["nofail" "x-systemd.automount" "noauto" "x-systemd.idle-timeout=600"]; # disconnects after 10 minutes (i.e. 600 seconds)
    fsType = "nfs";
  };

  fileSystems."/mnt/spool" = {
    device = "pi:/var/spool/asterisk";
    options = ["nofail" "x-systemd.automount" "noauto" "x-systemd.idle-timeout=600"]; # disconnects after 10 minutes (i.e. 600 seconds)
    fsType = "nfs";
  };

}
