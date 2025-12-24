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
    calls
    authenticator
    libreoffice
    discord
    signal-desktop
    glib
    tor-browser
    distrobox
    openscad
    arduino-ide
    arduino-cli

    prusa-slicer

    direnv

    gnomeExtensions.night-theme-switcher

    jetbrains.clion
    jetbrains.idea-ultimate

    podman-compose
    cmake
    gdb
    gcc
    go

    perlLibs
    pythonLibs

    mktemplate
    xtrkcad
  ];
}
