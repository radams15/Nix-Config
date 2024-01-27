{
  pkgs, ...
}: {
      dconf.settings = {
        "org/gnome/desktop/wm/preferences" = { # Left window controls
          "button-layout" = "close,minimize,maximize:appmenu";
        };

        "org/gnome/desktop/interface" = {
          "clock-show-weekday" = true;
          "clock-show-date" = true;
        };

        "org/gnome/desktop/sound" = { # 150% volume
          "allow-volume-above-100-percent" = true;
        };

        "org/gnome/mutter" = { # Scaling of X11 apps on Wayland.
          experimental-features = [ "scale-monitor-framebuffer" ];
        };
     };
 
}
