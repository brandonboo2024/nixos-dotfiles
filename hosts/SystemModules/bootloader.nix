{ lib, config, ... }:
let
  refindDreary = ../../refind-dreary;
  themeDir = "${refindDreary}/highres";

  themeFiles = lib.filesystem.listFilesRecursive themeDir;
  relTheme = src: lib.removePrefix (toString themeDir + "/") (toString src);
  themeAdditionalFiles =
    builtins.listToAttrs (map (src: {
      name = builtins.unsafeDiscardStringContext (
        "themes/refind-dreary/" + relTheme src
      );
      value = src;
    }) themeFiles);

  # ---- ADD THIS: copy rEFInd's default fallback icons into /boot/EFI/refind/icons ----
  refindPkg = config.boot.loader.refind.package;
  iconsDir1 = "${refindPkg}/share/refind/icons";
  iconsDir2 = "${refindPkg}/share/refind/refind/icons";
  refindIconsDir = if builtins.pathExists iconsDir1 then iconsDir1 else iconsDir2;

  refindIconFiles = lib.filesystem.listFilesRecursive refindIconsDir;
  relIcon = src: lib.removePrefix (toString refindIconsDir + "/") (toString src);

  refindIconsAdditionalFiles =
    builtins.listToAttrs (map (src: {
      # IMPORTANT: destination is RELATIVE to EFI/refind, so use "icons/...", not "EFI/refind/icons/..."
      name = builtins.unsafeDiscardStringContext ("icons/" + relIcon src);
      value = src;
    }) refindIconFiles);

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
        include themes/refind-dreary/theme.conf
				additionalFiles = themeAdditionalFiles // refindIconsAdditionalFiles;
    };
  };
}
