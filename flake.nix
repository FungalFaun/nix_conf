{
  description = "Home Manager configuration of broom";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

#    firefox-addons = {
#      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
#      inputs.nixpkgs.follows = "nixpkgs";
#    };
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
        specialArgs = {
          inherit inputs outputs;
          
        };
      };
    };

    homeConfigurations = {
      broom = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [./home/broom.nix];
        extraSpecialArgs = {inherit inputs outputs;};
      };

      work = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [./home/wsl.nix];
        extraSpecialArgs = {
          inherit inputs outputs;
          userSettings = {
            hostName = "work";
            userName = "adrian";
            git = {
              name = "Adrian Heide";
              email = "adrian.heide@if.no";
            };
          };
        };
      };
    };
  };
}
