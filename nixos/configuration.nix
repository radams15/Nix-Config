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
      #./virtualbox.nix
      ./thinkpad.nix
      ./share.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "the-brick"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

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
    extraGroups = [ "networkmanager" "wheel" ];
  };

  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.unstable-packages
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
  environment.gnome.excludePackages = with pkgs; [
    gnome3.totem
    gnome-photos
    gnome3.gnome-music
    gnome3.geary
    gnome3.cheese
    gnome-tour
    epiphany
  ];



  programs.steam.enable = true;

  environment.systemPackages = with pkgs; [
    ((custom_vim.override{ }).customize {
      name = "vim";

      vimrcConfig.packages.myplugins = with pkgs.vimPlugins; {
        start = [
          awesome-vim-colorschemes
          gruvbox
          nerdtree
          vim-devicons
          vim-airline
          vim-lsp
          vim-lsp-ale
          ale
          autoComplPop
        ];
        opt = [];
      };

      vimrcConfig.customRC = ''
        source ~/.config/vim/vimrc
      '';
    })
    home-manager
    perl
    python3
    ruby
    wget
    curl
    git
    gnumake
    file

    texlab
    llvmPackages.clang-unwrapped

    gnome.zenity
    cryptsetup
  ];

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

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  
  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
