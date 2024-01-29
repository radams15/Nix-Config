{
  pkgs, ...
}: {
  home.packages = with pkgs; [
    firefox
    discord
    freetube
    jellyfin-media-player
    signal-desktop
    gnome.gnome-tweaks
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

    cmake
    gdb
    gcc

    mktemplate
  ];
}
