{lib,pkgs,input,config,...}:

{
  home.packages = with pkgs; [
    # Tools required for Telescope
    ripgrep
    fd
    fzf

    # Language Servers
    nixpkgs-fmt # nix formatter
    gcc # compiler
    python3 #python
    lua-language-server
    clang-tools
    #nix lsp
    nil 
    typescript-language-server
    vscode-css-languageserver
    zls
    vscode-json-languageserver
    # java ls
    jdt-language-server 
    python313Packages.python-lsp-server

    # Needed for lazy.nvim
    nodejs
  ];

  programs.neovim = lib.mkForce{
    enable = true;
    viAlias = true;
    vimAlias = true;
    extraLuaPackages = ps: [
      ps.magick
    ];
    #for language servers, add them below
    extraPackages = with pkgs;[ 
    imagemagick 
    ];
	   extraLuaConfig = lib.mkAfter ''
	   '';
  };
}
