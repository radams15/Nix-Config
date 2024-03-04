{
  pkgs, inputs, config, ...
}: {
  programs.firefox = {
    enable = true;

    profiles = {
      default = {
        id = 0;
        name = "default";
        isDefault = true;

        search.default = "DuckDuckGo";

        extensions = with config.nur.repos.rycee.firefox-addons; [
          ublock-origin
          xbrowsersync
          bitwarden
        ];


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
