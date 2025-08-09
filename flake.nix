{
  description = "Home Manager configuration of broom";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hardware.url = "github:nixos/nixos-hardware";

    nur = {
     url = "github:nix-community/NUR";
     inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    astal = {
      url = "github:aylur/astal";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  }@inputs: let 
    inherit (self) outputs;

    lib = nixpkgs.lib // home-manager.lib;

    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    inherit lib;

    nixosModules = import ./modules/nixos;
    homeManagerModules = import ./modules/home-manager;

    nixosConfigurations = {
      tux = nixpkgs.lib.nixosSystem {
        modules = [./hosts/tux];  
        specialArgs = {inherit inputs outputs;};
      };

      gabumon = nixpkgs.lib.nixosSystem {
        modules = [./hosts/gabumon];  

        specialArgs = {inherit inputs outputs;};
      };
    };

    homeConfigurations = {
      broom = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [./home/broom.nix];
        extraSpecialArgs = {inherit inputs outputs;};
      };

      gabumon = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [./home/gabumon.nix];

        extraSpecialArgs = {inherit inputs outputs;};
      };

      faun = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [./home/faun.nix];
        extraSpecialArgs = {inherit inputs outputs;};
      };
    };
  };
}
