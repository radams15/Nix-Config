{
  pkgs, ...
}: {
  xdg.enable = true;

  xdg.configFile."mimeapps.list".force = true;

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "image/jpeg" = ["org.gnome.eog.desktop"];
      "image/tiff" = ["org.gnome.eog.desktop"];
      "text/x-python" = ["org.gnome.TextEditor.desktop"];
      "text/markdown" = ["org.gnome.TextEditor.desktop"];
      "application/pdf" = ["org.gnome.Evince.desktop"];
      "text/x-tex" = ["org.gnome.TextEditor.desktop"];
      "text/plain" = ["org.gnome.TextEditor.desktop"];
      "x-scheme-handler/discord-1170028348756471908" = ["discord-1170028348756471908.desktop"];

      "text/html" = "org.mozilla.Firefox.desktop";
      "x-scheme-handler/http" = "org.mozilla.Firefox.desktop";
      "x-scheme-handler/https" = "org.mozilla.Firefox.desktop";
      "x-scheme-handler/about" = "org.mozilla.Firefox.desktop";
      "x-scheme-handler/unknown" = "org.mozilla.Firefox.desktop";
    };
  };
}
