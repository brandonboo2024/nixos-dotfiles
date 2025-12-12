{config, lib, pkgs, ...}:
{
  stylix = {
    enable = true;
    image = ../../walls/ghibli.jpeg;
    #enable fonts provided by stylix
    autoEnable = true;
    fonts = {
        monospace = {
	  package = pkgs.nerd-fonts.iosevka-term;
	  name = "IosevkaTerm Nerd Font";
	};
	sansSerif = {
	  package = pkgs.inter;
	  name = "Inter";
	};
	serif = {
	  package = pkgs.libertine;
	  name = "Linux Libertine";
	};
	emoji = {
	  package = pkgs.noto-fonts-color-emoji;
	  name = "Noto Color Emoji";
	};
	sizes = {
	applications = 12;
	terminal = 14;
	desktop = 10;
	popups = 10;
	};
    };
    opacity = {
      applications = 0.92;
      terminal = 0.9;
      desktop = 0.97;
      popups = 0.9;
    };
    polarity = "dark";
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };
  };
}
