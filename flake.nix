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
		nvim-nightly = {
			url = "github:nix-community/neovim-nightly-overlay";
			inputs.nixpkgs.follows = "nixpkgs";
		};
  };

  outputs = inputs@{
    self, nixpkgs, home-manager, nixpkgs-stable, mango, dankMaterialShell, dgop, stylix,
    ...
  }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs{
      inherit system overlays;
      config.allowUnfree = true;
    };

    pkgsStable = import nixpkgs-stable{
      inherit system overlays;
      config.allowUnfree = true;
    };
		overlays = [
			inputs.nvim-nightly.overlays.default
		];
  in{
    nixosConfigurations = {
      # thinkpad config
      "Daedalus" = nixpkgs.lib.nixosSystem{
        inherit system;
	specialArgs = {
	  inherit pkgsStable;
		inherit inputs;
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
      dankMaterialShell.nixosModules.greeter
	  {
	    home-manager = {
	      useGlobalPkgs=true;
	      useUserPackages=true;
	      backupFileExtension = "backup";
				extraSpecialArgs = {
					inherit inputs;
					inherit pkgsStable; # optional, only if you use it in HM modules
				};
	      users.Daedalus = {
	        imports = [
	          ./home/boo/thinkpad.nix
						mango.hmModules.mango
						inputs.dankMaterialShell.homeModules.dank-material-shell
	        ];
	      };
	      sharedModules = [
	        {
		}
	      ];
	    };
	  }
	];
      };
	# add more devices downhere
      "Prometheus" = nixpkgs.lib.nixosSystem{
        inherit system;
	specialArgs = {
	  inherit pkgsStable;
		inherit inputs;
	};
	modules = [
	  ./hosts/yoga/default.nix #change this
	  # enable home manager module
	  home-manager.nixosModules.home-manager
	  #enable NixOS module for mangoWC, it provides a HM and NixOS one hence the repeat
	  mango.nixosModules.mango{
	    programs.mango.enable = true;
	  }
	  stylix.nixosModules.stylix
		dankMaterialShell.nixosModules.greeter
	  {
	    home-manager = {
	      useGlobalPkgs=true;
	      useUserPackages=true;
	      backupFileExtension = "backup";
				extraSpecialArgs = {
					inherit inputs;
					inherit pkgsStable; # optional, only if you use it in HM modules
				};
	      users.Prometheus = {
	        imports = [
	          ./home/boo/yoga.nix
						mango.hmModules.mango
						inputs.dankMaterialShell.homeModules.dank-material-shell
	        ];
	      };
	      sharedModules = [
	        {
		}
	      ];
	    };
		}
	];
      };
# add more devices here
    };
	};
}
