{
  description = "Modular NixOS Configuration with MangoWC and DMS";

  inputs = {
    nixpkgs-stable.url = "nixpkgs/nixos-25.11";
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # mangowc flake
    flake-parts.url = "github:hercules-ci/flake-parts";
    mango = {
      url = "github:DreamMaoMao/mango";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dgop = {
      url = "github:/AvengeMedia/dgop";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dankMaterialShell = {
      url = "github:AvengeMedia/DankMaterialShell";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.dgop.follows = "dgop";
    };
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # sops-nix for secret management
    sops-nix.url = "github:Mic92/sops-nix";
  };

  outputs = inputs@{
    self, nixpkgs, home-manager, nixpkgs-stable, mango, dankMaterialShell, dgop, stylix,
    sops-nix,...
  }:
  let
    system = "x86_64-linux";
    
    pkgs = import nixpkgs{
      inherit system;
      config.allowUnfree = true;
    };

    pkgsStable = import nixpkgs-stable{
      inherit system;
      config.allowUnfree = true;
    };
  in{
    nixosConfigurations = {
      # thinkpad config
      "Daedalus" = nixpkgs.lib.nixosSystem{
        inherit system;
	specialArgs = {
	  inherit pkgsStable;
	  autoUpgradeFlakeRef = "/etc/nixos-dotfiles#Daedalus"; # this is for maintenance.nix
	};
	modules = [
	  ./hosts/thinkpad/default.nix
	  # enable home manager module
	  home-manager.nixosModules.home-manager
	  #enable NixOS module for mangoWC, it provides a HM and NixOS one hence the repeat
	  mango.nixosModules.mango{
	    programs.mango.enable = true;
	  }
	  stylix.nixosModules.stylix
      sops-nix.nixosModules.sops
	  {
	    home-manager = {
	      useGlobalPkgs=true;
	      useUserPackages=true;
	      backupFileExtension = "backup";
	      users.Daedalus = {
	        imports = [
	          ./home/boo/thinkpad.nix
		  mango.hmModules.mango
	  	  inputs.dankMaterialShell.homeModules.dankMaterialShell.default
	        ];
	      };
	      extraSpecialArgs = {
		pkgs = import nixpkgs{
		  system = "x86_64-linux";
		  config.allowUnfree = true;
		};
	      };
	      sharedModules = [
	        {
		}
	      ];
	    };
	  }
	  ./maintenance.nix
	];
      };
	# add more devices downhere
    };
  };
}
