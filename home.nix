{ config, lib, pkgs, ... }:

{
home-manager.users.rhys = { pkgs, ... } : {
      nixpkgs.config.allowUnfree = true;
      home.stateVersion = config.system.stateVersion;
      home.packages = with pkgs; [
        firefox
        discord
        freetube
        jellyfin-media-player
        signal-desktop
        gnome.gnome-tweaks
        evolution
        davmail
        starship
      ];
      
      programs.starship = {
      	enable = true;
      	settings = {
      	
      	};
      };

      programs.zsh = {
        enable = true;
        oh-my-zsh.enable = true;
        initExtra = ''
          eval "$(starship init zsh)"
        '';
        
        plugins = with pkgs; [
	      {
                name = "zsh-autosuggestions";
                src = fetchFromGitHub {
		  owner = "zsh-users";
		  repo = "zsh-autosuggestions";
		  rev = "v0.7.0";
		  sha256 = "sha256-KLUYpUu4DHRumQZ3w59m9aTW6TBKMCXl2UcKi4uMd7w=";
		};
		file = "zsh-autosuggestions.zsh";
	      }
	 ];
      };

      dconf.settings = {
        "org/gnome/desktop/wm/preferences" = {
          "button-layout" = "close,minimize,maximize:appmenu";
        };

        "org/gnome/desktop/interface" = {
          "clock-show-weekday" = true;
          "clock-show-date" = true;
        };

        "org/gnome/desktop/sound" = {
          "allow-volume-above-100-percent" = true;
        };

     };
};
}
