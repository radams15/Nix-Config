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
        gimp
        prismlauncher
        glib
        tor-browser-bundle-bin
        rhythmbox
        distrobox

        gnomeExtensions.gsconnect
        gnomeExtensions.night-theme-switcher
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
          export EDITOR=vim
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

      programs.vim = {
        enable = true;
        plugins = with pkgs.vimPlugins; [
          awesome-vim-colorschemes
        ];
        extraConfig = ''
          set mouse=a
          syntax enable
          set number
          set tabstop=4 " tabs=4 spaces
          set shiftwidth=4 " 4 spaces for an indent
          set expandtab " tabs => spaces
          set termguicolors
          colorscheme apprentice
        '';
      };



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
};
}
