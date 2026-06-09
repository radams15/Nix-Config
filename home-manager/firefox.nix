{
  pkgs, inputs, config, ...
}: {
  programs.firefox = {
    enable = true;
    configPath = ".mozilla/firefox";

    profiles = {
      default = {
        id = 0;
        name = "default";
        isDefault = true;

        search.default = "ddg";
        search.force = true;

        userChrome = ''
          @import "${
              inputs.self.packages.${pkgs.system}.lepton-firefox-theme
          }/userChrome.css";
        '';
        userContent = ''
          @import "${
            inputs.self.packages.${pkgs.system}.lepton-firefox-theme
          }/userContent.css";
        '';
        extraConfig = builtins.readFile
          "${inputs.self.packages.${pkgs.system}.lepton-firefox-theme}/user.js";

      };
    };

  };
}
