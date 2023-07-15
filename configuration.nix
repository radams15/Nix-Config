# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [
      "${builtins.fetchGit {
        url = "https://github.com/NixOS/nixos-hardware.git";
        rev = "1e0872458b84c2b6b3974e03ced26b87bb6df27f"; # Uses the old surface-kernel and old iptsd.
      }}/microsoft/surface/common"
      
      "${builtins.fetchTarball {
        url = "https://github.com/nix-community/home-manager/archive/release-23.05.tar.gz";
      }}/nixos" # Home-manager
      
      ./hardware-configuration.nix
      ./home.nix
    ];
    
  system.stateVersion = "23.05";
  system.autoUpgrade.enable = true;
  nixpkgs.config.allowUnfree = true;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  
  microsoft-surface.kernelVersion = "5.19.17";
  microsoft-surface.ipts.enable = false;

  networking.networkmanager.enable = true;
  networking.hostName = "thinbrick";

  time.timeZone = "Europe/London";
  i18n.defaultLocale = "en_GB.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };

  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  
  services.xserver = {
    layout = "gb";
    xkbVariant = "mac";
  };

  console.keyMap = "uk";

  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };

  virtualisation = {
    podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork.settings = {
        dns_enabled = true;
      };
    };
  };

  services.xserver.libinput.enable = true;
  
  programs.zsh.enable = true;

  users.users.rhys = {
    isNormalUser = true;
    shell = pkgs.zsh;
    description = "Rhys Adams";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  
  nixpkgs.overlays = [
    (
      self: super:
      {
        iptsd = super.callPackage ./iptsd.nix {}; # Enable legacy iptsd
      }
    )
  ];

  /*services.davmail.enable = true;
  services.davmail.url = "https://outlook.office365.com/EWS/Exchange.asmx";
  services.davmail.config = { # Not working right now
    davmail.mode = "EWS";
  };*/

  systemd.services.iptsd = { # Enable iptsd service
    description = "IPTSD";
    path = with pkgs; [ iptsd ];
    script = "iptsd";
    wantedBy = [ "network-online.target" ];
  };

  environment.systemPackages = with pkgs; [
    vim
    wget
    libwacom-surface
    podman
    podman-compose
    epson-escpr
  ];

  services.printing = {
    enable = true;
    drivers = [ pkgs.epson-escpr ];
  };

  services.avahi = {
    enable = true;
    nssmdns = true;
  };

  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  fileSystems."/mnt/share" = {
    device = "server:/mnt/share";
    fsType = "nfs";
    options = [
      "nofail"
    ];
  };
  

  xdg.mime.enable = true;
  xdg.mime.defaultApplications = {
    "text" = "org.gnome.TextEditor"; # Gnome text editor is default text editor
  };

 
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [
      8080
      3000
    ];
    allowedUDPPorts = [
    
    ];
  };
}
