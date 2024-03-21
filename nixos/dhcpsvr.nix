{ config, lib, pkgs, modulesPath, ... }:

{
  services.dnsmasq = {
    enable = true;
    settings = {
      # upstream DNS servers
      server = [ "9.9.9.9" "8.8.8.8" "1.1.1.1" ];
      # sensible behaviours
      domain-needed = true;
      bogus-priv = true;
      no-resolv = true;

      # Cache dns queries.
      cache-size = 1000;

      dhcp-range = [ "enp0s31f6,10.0.0.2,10.0.0.254,255.255.255.0,24h" ];
      interface = "enp0s31f6";
      dhcp-host = "10.0.0.1";

      # local domains
      local = "/lan/";
      domain = "lan";
      expand-hosts = true;

      # don't use /etc/hosts as this would advertise surfer as localhost
      no-hosts = true;
      address = "/surfer.lan/10.0.0.1";
    };
  };
}
