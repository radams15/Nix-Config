{
  pkgs, ...
}: let
 wallpaperImg = pkgs.fetchurl {
   url = "https://immich.therhys.co.uk/api/assets/f1358881-e10c-4e50-a997-9c8dfd9e6c44/original?key=USPFZExN7ErXQhzaMYrQeCuB8yEWQQHpW-nQ1fZEsHk0d2taOgYy--sCcW7H9lJnIT4&c=ZcYNFYKIeIh%2Fh4iHd2iIeFV3UIYH&edited=true";
   hash = "sha256-JBZtQxdqxrKo5ocNNO2noI6DpsoAItnGafBEoM2WGXI=";
 };

in {
      dconf.settings = {
        "org/gnome/desktop/wm/preferences" = { # Left window controls
          "button-layout" = "close,minimize,maximize:appmenu";
        };

        "org/gnome/desktop/interface" = {
          "clock-show-weekday" = true;
          "clock-show-date" = true;
          "show-battery-percentage" = true;

        };

        "org/gnome/desktop/sound" = { # 150% volume
          "allow-volume-above-100-percent" = true;
        };

        "org/gnome/mutter" = { # Scaling of X11 apps on Wayland.
          experimental-features = [ "scale-monitor-framebuffer" ];
          "workspaces-only-on-primary" = false;
        };

        "org/gnome/desktop/background" = {
          picture-uri = "${wallpaperImg}";
          picture-uri-dark = "${wallpaperImg}";
        };

        "org/gnome/settings/daemon/plugins/color" = {
          "night-light-enabled" = true;
        };

        "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
          binding="<Control><Alt>t";
          command="gnome-terminal";
          name="term";
        };

        "org/gnome/settings-daemon/plugins/media-keys" = {
          custom-keybindings=["/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"];
        };

     };
 
}
