# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{inputs, config, lib, pkgs, pkgsStable, ... }:

{
  imports =
    [ 
      #include common baselevel packages
      ./SystemModules/packages.nix
      #include stylix options
      ./SystemModules/stylix.nix
    ];

  #Boot loader settings
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Configure network connections interactively with nmcli or nmtui.
  networking.networkmanager.enable = true;
  hardware.bluetooth.enable = true;
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;
  # allow proprietary software
  nixpkgs.config.allowUnfree = true;
  # Set your time zone.
  time.timeZone = "Asia/Singapore";

  # displayManager settings: ly
  services.displayManager = {
    ly.enable = true;
    ly.settings = {
      bigclock = "en";
    };
  };

  # setting wayland display for swayidle to recognise
  environment = {
    # setting session variables
    sessionVariables = {
    };
    # setting environment variables
    variables = {
      EDITOR = "nvim";
    };
  };

  # qtile settings, to be deleted soon in favour of mangoWM
  # services.xserver = {
  #   enable = true;
  #   autoRepeatDelay = 150;
  #   autoRepeatInterval = 35;
  #   windowManager.qtile.enable = true;
  # };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound.
  hardware.pulseaudio.enable=false;
  services.pipewire = {
    # enable support and different compatabilities
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.Daedalus = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      tree
    ];
  };
  programs.nano.enable = false;
  # programs.firefox.enable = true;
  # programs.neovim = {
  #   enable = true;
  #   defaultEditor = true;
  #   viAlias = true;
  #   vimAlias = true;
  # };
  fonts.packages = with pkgs;[
    nerd-fonts.jetbrains-mono
    nerd-fonts.iosevka-term
  ];
  
  nix.settings.experimental-features = ["nix-command" "flakes"];
  system.stateVersion = "25.11"; # just dont touch this
}

