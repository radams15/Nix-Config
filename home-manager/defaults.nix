{
  pkgs, ...
}: {
  xdg.enable = true;

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "image/jpeg" = ["org.gnome.eog.desktop"];
      "text/x-python" = ["org.gnome.TextEditor.desktop"];
      "text/markdown" = ["org.gnome.TextEditor.desktop"];
      "application/pdf" = ["org.gnome.Evince.desktop"];
      "text/x-tex" = ["org.gnome.TextEditor.desktop"];
    };
  };
}
