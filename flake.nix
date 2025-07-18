{
  description = "Home Manager configuration of broom";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.05";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    #nur = {
    #  url = "github:nix-community/NUR";
    #  inputs.nixpkgs.follows = "nixpkgs";
    #};

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
    };

    homeConfigurations = {
      broom = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [./home/broom.nix];
        extraSpecialArgs = {inherit inputs outputs;};
      };

<<<<<<< Updated upstream
      work = home-manager.lib.homeManagerConfiguration {
=======
<<<<<<< Updated upstream
      urania = home-manager.lib.homeManagerConfiguration {
=======
      faun = home-manager.lib.homeManagerConfiguration {
>>>>>>> Stashed changes
>>>>>>> Stashed changes
        inherit pkgs;

        modules = [./home/wsl.nix];
        extraSpecialArgs = {inherit inputs outputs;};
      };
    };
  };
}
