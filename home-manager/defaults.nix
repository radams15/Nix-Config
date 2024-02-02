{
  pkgs, ...
}: {
  home.xdg.enable = true;

  home.xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "application/pdf" = ["org.gnome.Evince.desktop"];
      "text/markdown" = ["org.gnome.TextEditor.desktop"];
    };
  };
}
