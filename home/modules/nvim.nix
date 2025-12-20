{lib,pkgs,inputs,config,...}:

{
  home.packages = with pkgs; [
    # Tools required for Telescope
    ripgrep
    fd
    fzf

		# c++
		bear
		glibc
		gnumake
    # Language Servers
    nixpkgs-fmt # nix formatter
    gcc # c compiler
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
		rust-analyzer

    # Needed for lazy.nvim
    nodejs
  ];
	# stylix.targets.neovim.enable = false;
  programs.neovim = lib.mkForce{
    enable = true;
    viAlias = true;
    vimAlias = true;
		package = inputs.nvim-nightly.packages.${pkgs.system}.default;
		extraPackages = with pkgs; [
			tree-sitter
		];
	  extraLuaConfig = lib.mkAfter ''
			require("config")
			require("options")
			require("keymaps")
			require("treesitter")
			require("harpoons")
	   '';
  };
}
