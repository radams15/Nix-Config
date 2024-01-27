# This file defines overlays
{inputs, ...}: {
  # This one brings our custom packages from the 'pkgs' directory
  additions = final: _prev: import ../pkgs {pkgs = final;};

  # This one contains whatever you want to overlay
  # You can change versions, add patches, set compilation flags, anything really.
  # https://nixos.wiki/wiki/Overlays
  modifications = final: prev: {
    custom_vim = (prev.vim_configurable.overrideAttrs(old: {
      version = "8.2.5172";

      src = prev.fetchFromGitHub {
        owner = "vim";
        repo = "vim";
        rev = "v8.2.5172";
        hash = "sha256-ycp9K7IpXBFLE9DV9/iQ+N1H7EMD/tP/KGv2VOXoDvE";
      };
    })).override{
      perlSupport = true;
    };
  };

  # When applied, the unstable nixpkgs set (declared in the flake inputs) will
  # be accessible through 'pkgs.unstable'
  unstable-packages = final: _prev: {
    unstable = import inputs.nixpkgs-unstable {
      system = final.system;
      config.allowUnfree = true;
    };
  };
}
