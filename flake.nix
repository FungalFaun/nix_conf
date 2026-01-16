{
  description = "Home Manager configuration of broom";

  inputs = {
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hardware.url = "github:nixos/nixos-hardware";

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
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
      # Tuxedo laptop
      tentomon = nixpkgs.lib.nixosSystem {
        modules = [./hosts/tentomon];  
        specialArgs = {inherit inputs outputs;};
      };

      # Desktop
      gabumon = nixpkgs.lib.nixosSystem {
        modules = [./hosts/gabumon_plasma];  
        specialArgs = {inherit inputs outputs;};
      };

      biyomon = nixpkgs.lib.nixosSystem {
        modules = [./hosts/biyomon];  
        specialArgs = {inherit inputs outputs;};
      };

      patamon = nixpkgs.lib.nixosSystem {
        modules = [./hosts/patamon];  
        specialArgs = {inherit inputs outputs;};
      };
    };

    homeConfigurations = {
      #Tuxedo laptop
      "broom@tentomon" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [./home/broom/tentomon.nix];
        extraSpecialArgs = {inherit inputs outputs;};
      };

      "broom@patamon" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [./home/broom/patamon.nix];
        extraSpecialArgs = {inherit inputs outputs;};
      };

      # Desktop
      "broom@gabumon" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [./home/broom/gabumon_plasma.nix];
        extraSpecialArgs = {inherit inputs outputs;};
      };

      # NixOS Wsl
      "broom@biyomon" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [./home/broom/biyomon.nix];
        extraSpecialArgs = {inherit inputs outputs;};
      };

      # Standalone wsl
      faun = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [./home/faun.nix];
        extraSpecialArgs = {inherit inputs outputs;};
      };
    };
  };
}
