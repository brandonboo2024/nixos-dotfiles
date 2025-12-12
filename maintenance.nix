{
  config, pkgs, inputs, autoUpgradeFlakeRef, ...
}:

{
  system.autoUpgrade = {
    enable = true;
    dates = "02:30";
    flake = autoUpgradeFlakeRef;
    flags = [
      "--update-input"
      "nixpkgs"
      "-L"
    ];
    randomizedDelaySec = "45min";
  };
  nix.gc = {
    automatic = true;
    dates = "01:00";
    options = "--delete-older-than 7d";
  };
}
