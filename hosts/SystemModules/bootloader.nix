{ lib, ... }:
let
  refindDreary = ./themes/refind-dreary;
  themeDir = "${refindDreary}/highres"; # or lowres/clover

  themeFiles = lib.filesystem.listFilesRecursive themeDir;

  themeAdditionalFiles = builtins.listToAttrs (map (src: {
    name = "EFI/refind/themes/refind-dreary/"
      + lib.removePrefix (toString themeDir + "/") (toString src);
    value = src;
  }) themeFiles);
in
{
	boot.loader = {
		efi = {
			canTouchEfiVariables = true;
			efiSysMountPoint = "/boot";
		};
		systemd-boot.enable = false;
		grub.enable = false;
		refind = {
			enable = true;
			maxGenerations = 7;
			extraConfig = ''
				menuentry "Windows" {
					loader /EFI/Microsfot/Boot/bootmgfw.efi
					icon themes/refind-dreary/icons/os_win8.png
				}
				include themes/refind-dreary/theme.conf
			'';
			additionalFiles = themeAdditionalFiles;
		};
	};
}

