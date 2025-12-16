{config, pkgs, pkgsStable,inputs, ...}:
{
  home.packages = with pkgs;[
    #app launcher
    rofi
    # misc
    fastfetch
    # utils for mangowc
    wl-clipboard
    sway-audio-idle-inhibit
    wl-clip-persist
    grim
    slurp
    cliphist
    #terminal
    kitty
    #yazi utils
    p7zip
    unzip
    # moosic
    spotify
    #note taking
    obsidian
    #cli utils
    bat
    # audio equalisers
    easyeffects
  ];

}
