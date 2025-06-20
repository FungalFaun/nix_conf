{
  pkgs,
  inputs,
  outputs,
  ...
}: let 
  combinedDotnet = with pkgs.dotnetCorePackages; combinePackages [
    sdk_6_0
    sdk_8_0
    sdk_9_0_3xx
    runtime_8_0
  ];

  username = "adrian";
in {
  imports = [
    outputs.homeManagerModules.fonts

    ../packages/home-manager/cli
    ../packages/home-manager/dev/neovim
  ];

  home = {
    username = username;
    homeDirectory = "/home/${username}";
  };

  home.packages = with pkgs; [
    git
    nixd
    gcc
    cmake
    cargo
    rustc
    unzip

    stylua
    typescript
    typescript-language-server
    nodejs_20
    yarn
    combinedDotnet
    
    lua-language-server
    bicep

    #git-credential-manager
  ];


  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [
      "dotnet-sdk-6.0.428"
    ];
  };

  nix = {
    package = pkgs.nix;
    nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      warn-dirty = false;
    };
  };

  home = {
    sessionVariables = {
      EDITOR = "nvim";
      DOTNET_ROOT = "${combinedDotnet}/share/dotnet";

      FLAKE = "/home/${username}/.config/home-manager";
      HM_CONFIG = "work";
      USERNAME = username;
      GIT_NAME = "Adrian Heide";
      GIT_EMAIL = "adrian.heide@if.no";
    };

    sessionPath = [
      "/home/adrian/.dotnet/tools"
    ];
  };

  services = {
  };

  systemd.user.startServices = "sd-switch";
  programs.home-manager.enable = true;

  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.05"; # Please read the comment before changing.
}
