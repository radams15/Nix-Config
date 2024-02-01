{
  pkgs, ...
}: {
  home.packages = with pkgs; [
    authenticator
    libreoffice
    firefox
    discord
    freetube
    jellyfin-media-player
    signal-desktop
    gnome.gnome-tweaks
    gnome.eog
    evolution
    davmail
    starship
    gimp
    glib
    tor-browser-bundle-bin
    rhythmbox
    distrobox

    direnv

    gnomeExtensions.gsconnect
    gnomeExtensions.night-theme-switcher

    jetbrains.clion
    jetbrains.idea-ultimate
    jetbrains.pycharm-professional
    jetbrains.phpstorm
    jetbrains.ruby-mine
    jetbrains.rider
    jetbrains.goland

    podman-compose
    cmake
    gdb
    gcc

    mktemplate
  ];
}
