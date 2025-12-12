{config, pkgs, pkgsStable, ...}:
{
  environment.systemPackages = with pkgs; [
    # desktop apps
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    foot
    # utilities
    bluez
    bluez-tools
    pipewire
    pulseaudio
    wireplumber
    xwayland
    xorg.xkbcomp
    xkeyboard-config
    xdg-desktop-portal-wlr
    xdg-desktop-portal-gtk
    #coding
    git
    #cli tools
    yazi
    # file management
    kdePackages.qtsvg
    kdePackages.dolphin
    # social media
    Telegram
    whatsapp-electron
    obsidian
  ];
}
