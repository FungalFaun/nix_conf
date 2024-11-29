{
  description = "Home Manager configuration of broom";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

#    stylix.url = "github:danth/stylix";
     
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

    nixosConfigurations = {
      tux = nixpkgs.lib.nixosSystem {
	modules = [./hosts/tux];  
	specialArgs = {inherit inputs outputs;};
      };
    };

    homeConfigurations = {
      broom = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [./home.nix];
        extraSpecialArgs = {inherit inputs outputs;};
      };
    };
  };
}
