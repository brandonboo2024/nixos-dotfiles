{config, lib, pkgs, ...}:
{
  stylix = {
    enable = true;
    image = ../../walls/mountain.png;
		base16Scheme = "${pkgs.base16-schemes}/share/themes/zenbones.yaml";
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
	  package = pkgs.libertine;
	  name = "Linux Libertine";
	};
	emoji = {
	  package = pkgs.noto-fonts-color-emoji;
	  name = "Noto Color Emoji";
	};
	sizes = {
	applications = 12;
	terminal = 15;
	desktop = 12;
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
