{
  pkgs, ...
}:
let
  perlLibs = pkgs.perl.withPackages (p: [
    p.PerlCritic
    p.PLS
  ]);

  pythonLibs = pkgs.python3.withPackages (p: [
    p.flake8
    p.pyls-flake8
  ]);
in {
  home.packages = with pkgs; [
    vlc
    gajim
    remmina
    authenticator
    libreoffice
    discord
    freetube
    jellyfin-media-player
    signal-desktop
    gnome.gnome-tweaks
    gnome.eog
    evolution
    starship
    gimp
    glib
    tor-browser-bundle-bin
    rhythmbox
    distrobox
    marker

    direnv

    gnomeExtensions.night-theme-switcher

    jetbrains.clion
    jetbrains.idea-ultimate
    jetbrains.goland

    podman-compose
    cmake
    gdb
    gcc

    perlLibs
    pythonLibs

    mktemplate
    ida-free
  ];
}
