{config, lib, pkgs, ...}:
{
  stylix = {
    enable = true;
    image = ../../walls/street.png;
    #enable fonts provided by stylix
    autoEnable = true;
    fonts = {
        monospace = {
	  package = pkgs.nerd-fonts.iosevka-term;
	  name = "IosevkaTerm Nerd Font";
	};
	sansSerif = {
	  package = pkgs.merriweather;
	  name = "Merriweather";
	};
	serif = {
	  package = pkgs.merriweather;
	  name = "Merriweather";
	};
	emoji = {
	  package = pkgs.noto-fonts-color-emoji;
	  name = "Noto Color Emoji";
	};
	sizes = {
	applications = 12;
	terminal = 15;
	desktop = 11;
	popups = 12;
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
      size = 30;
    };
  };
}
