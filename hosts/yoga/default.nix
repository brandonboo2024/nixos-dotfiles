# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, pkgsStable, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ../base.nix
      ./hardware-configuration.nix
      ./stylix.nix
      ./sound.nix
      ./dankgreeter.nix
			./maintenance.nix
    ];
  networking.hostName = "Prometheus"; # Define your hostname.
  # specific packages/ settings to be changed here
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    QT_SCALE_FACTOR_ROUNDING_POLICY = "PassThrough";
  };

  # for nvidia driver
  hardware.enableAllFirmware = true;
  hardware.graphics.enable = true;
  hardware.nvidia = {
    open = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    modesetting.enable = true;
  };
  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia.prime = {
    # enables you to run 'nvidia-offload <program>' to offload a program to your dGPU
    offload.enableOffloadCmd = true;
    offload.enable = true;
    intelBusId = "PCI:0:2:0";
    nvidiaBusId = "PCI:1:0:0";
  };
    
}

