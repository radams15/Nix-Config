{
  pkgs, ...
}: let
 wallpaperImg = pkgs.fetchurl {
   url = "https://images.unsplash.com/photo-1509641402296-b7f020ccf694?ixlib=rb-4.0.3&q=85&fm=jpg&crop=entropy&cs=srgb&dl=vincent-van-zalinge-TtEqhAqy_GE-unsplash.jpg&w=1920";
   hash = "sha256-ijOK6UDjz3KrTdWRU6ieQQhtqhGoG/9ZI/lb8jOsgFw=";
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
     };
 
}
