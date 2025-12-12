{config, pkgs, pkgsStable, inputs, ...}:

let
  dotfiles = "${config.home.homeDirectory}/nixos-dotfiles/config";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  configs = {
    rofi = "rofi";
    mango = "mango";
    nvim = "nvim";  #uncomment after adding your own nvim config
  };
in
{
  imports = [
    ./modules/mangowc.nix
    ./modules/HomePackages.nix
    ./modules/dms.nix
    ./modules/kitty.nix
    ./modules/yazi.nix
    ./modules/nvim.nix
    ./modules/swayidle.nix
    ./modules/firefox.nix
  ];
  programs.git = {
    enable = true;
    settings = {
      user.name = "brandonboo2024";
      user.email = "brandonboo2024@computing.smu.edu.sg";
    };
  };
  programs.bash={
    enable = true;
    shellAliases = {
      btw = "echo what am i doing";
    };
  };
  # special symlink for nvim to keep stylix config as it would clash with init.lua
  # xdg.configFile."nvim/lua" = {
  #   source = create_symlink "${dotfiles}/nvim/lua";
  #   recursive = true;
  # }
  # //
  xdg.configFile = (builtins.mapAttrs (name: subpath: {
    source = create_symlink "${dotfiles}/${subpath}";
    recursive = true;
  }) (builtins.removeAttrs configs["nvim"]))
  // #special case for nvim to symlink lua folder only for stylix keeping
  {
    "nvim/lua" = {
      source = create_symlink "${dotfiles}/nvim/lua";
      recursive = true;
    };
    "nvim/plugin" = {
        source = create_symlink "${dotfiles}/nvim/plugin";
        recursive = true;
    };
  };
  # symlinking configs not done by nix language
  

  home.stateVersion = "25.11";
}
