{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    ((vim-full.override{ }).customize {
      name = "vim";

     vimrcConfig.packages.myVimPackage = with pkgs.vimPlugins; {
       start = [
          awesome-vim-colorschemes
          gruvbox
          nerdtree
          nerdcommenter
          vim-devicons
          vim-airline
       ];

       opt = [];
      };

      vimrcConfig.customRC = ''
        source ~/.vim/vimrc
      '';
    })

    openvpn

    gnome-terminal
    file-roller
    eog
    gnome-tweaks
    evolution
    distrobox

    dnsutils
    home-manager
    tmux
    perl
    python3
    wget
    curl
    git
    gnumake
    file
    ansible
    dhcpcd

    virt-manager
  ];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };

}
