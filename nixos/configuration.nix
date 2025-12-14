# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:
let
  autoComplPop = pkgs.vimUtils.buildVimPlugin {
    name = "vim-autocomplpop";
    src = pkgs.fetchFromGitHub {
      owner = "vim-scripts";
      repo = "AutoComplPop";
      rev = "2.14.1";
      hash = "sha256-HojOBhsYg3hPxObcbutr2sCMzco271XibeD9dk8q4g4=";
    };
  };
in
{
  imports =
    [
      ./thinkpad.nix
      ./share.nix
      # ./dhcpsvr.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "the-brick";

  networking.extraHosts = ''
    10.0.0.2 server
  '';

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/London";

  # Select internationalisation properties.
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

  # Increase tmpfs size.
  # services.logind.extraConfig = "RuntimeDirectorySize=4G";
  boot.extraModprobeConfig = ''
  blacklist dvb_usb_rtl28xxu
  blacklist rtl2832
  blacklist dvb_usb_v2
  '';

  # Configure keymap in X11
  services.xserver = {
    layout = "gb";
    xkbVariant = "mac";
  };

  # Make normal shebangs work
  services.envfs.enable = true;

  documentation.nixos.enable = false; # remove nix manual program

  services.fwupd.enable = true;

  # Configure console keymap
  console.keyMap = "uk";

  users.users.rhys = {
    isNormalUser = true;
    description = "Rhys Adams";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" "plugdev" ];
  };

  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      # outputs.overlays.modifications
      # outputs.overlays.unstable-packages
    ];
    config = {
      allowUnfree = true;
    };
  };

  nix.settings = {
    experimental-features = "nix-command flakes";
  };

  environment.variables.EDITOR = "vim";

  security.sudo.wheelNeedsPassword = false;

  services.xserver.enable = true;
  services.xserver.excludePackages = [ pkgs.xterm ];

  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  services.gnome.gnome-remote-desktop.enable = false;

  environment.gnome.excludePackages = with pkgs; [
    totem
    gnome-photos
    gnome-music
    geary
    cheese
    gnome-remote-desktop
    gnome-tour
    gnome-console
    epiphany
  ];

  services.tor = {
    enable = true;
    client.enable = true;
  };

  environment.systemPackages = with pkgs; [
    ((vim-full.override{ }).customize {
      name = "vim";

     vimrcConfig.packages.myVimPackage = with pkgs.vimPlugins; {
       start = [
          awesome-vim-colorschemes
          gruvbox
          nerdtree
          # vim-devicons
          # vim-airline
          # vim-lsp
          # vim-lsp-ale
          # ale
          # autoComplPop
       ];

       opt = [];
      };

      vimrcConfig.customRC = ''
        source ~/.vim/vimrc
      '';
    })

    openvpn
    networkmanager-openvpn

    gnome-terminal
    eog
    gnome-tweaks
    evolution
    distrobox

    home-manager
    rtl-sdr
    tmux
    perl
    python3
    wget
    curl
    git
    gnumake
    file

    virt-manager

    wine
    winetricks
  ];

  services.udev.packages = [ pkgs.rtl-sdr ];
  hardware.rtl-sdr.enable = true;

  hardware.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };


  security.rtkit.enable = true;
  virtualisation = {
    podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork.settings = {
        dns_enabled = true;
      };
    };

    libvirtd = {
      enable = true;
      qemu = {
        package = pkgs.qemu_kvm;
        runAsRoot = true;
        swtpm.enable = true;
      };
    };
  };

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  services.avahi = {
    enable = true;
    nssmdns = true;
    openFirewall = true;
  };
  
  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  services.pia.enable = true;
  services.pia.authUserPassFile = "/home/rhys/piacreds.txt";

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?

}
