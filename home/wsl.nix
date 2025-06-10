{
  pkgs,
  inputs,
  outputs,
  ...
}: let 
  combinedDotnet = with pkgs.dotnetCorePackages; combinePackages [
    sdk_6_0
    sdk_8_0
    runtime_8_0
  ];
in {
  imports = [
    outputs.homeManagerModules.fonts

    ../packages/home-manager/cli
    ../packages/home-manager/dev/neovim
  ];

  home = {
    username = "adrian";
    homeDirectory = "/home/adrian";
    #sessionPath = [ "$HOME/.local/bin" ];
  };

  home.packages = with pkgs; [
    git
    nixd
    gcc
    cmake
    cargo
    rustc
#    neovim
    unzip

    stylua
    typescript
    typescript-language-server
    nodejs_22
    yarn
    combinedDotnet
    
    lua-language-server
    bicep

    git-credential-manager
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

  home.sessionVariables = {
    EDITOR = "nvim";
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
