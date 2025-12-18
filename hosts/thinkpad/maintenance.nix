{
  config, pkgs, inputs, autoUpgradeFlakeRef, ...
}:

{
  system.autoUpgrade = {
    enable = true;
    dates = "02:30";
    flake = "/home/Daedalus/nixos-dotfiles#Daedalus";
    flags = [
        "--recreate-lock-file"
        "--commit-lock-file"
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
