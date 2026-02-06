{
  pkgs,
  inputs,
  outputs,
  config,
  lib,
  ...
}: let 
  combinedDotnet = with pkgs.dotnetCorePackages; combinePackages [
    sdk_6_0
    sdk_8_0
    sdk_9_0_3xx
    runtime_8_0
  ];

  username = "faun";
in {
  imports = [
    outputs.homeManagerModules.fonts
    inputs.sops-nix.homeManagerModules.sops

    ../features/home-manager/cli
    ../features/home-manager/cli/direnv.nix
    ../features/home-manager/dev/nixvim
    ../features/home-manager/dev/work

    ../features/home-manager/dev/default.nix
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
    nodejs_24
    yarn
    combinedDotnet
    
    lua-language-server
    bicep
    azure-cli
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
    };

    sessionPath = [
      "/home/${username}/.dotnet/tools"
    ];
  };

  programs = {
    zsh.shellAliases = let
      API = "${config.home.homeDirectory}/dev/party-master/src/cloudix/Api";
    in {
      goto_api= "cd ${API}";

      start_api= "cd ${API} && ${API}/scripts/0_build_container.sh && ${API}/scripts/1_run_container.sh";
      start_all= "cd ${API} && docker compose up -d";

      kill_api= "docker kill $(docker ps -q --filter=\"name=api\")";
      kill_all= "docker kill $(docker ps -q)";
    };
  
    direnv.enable = lib.mkForce true;
  };

  programs.git.settings.credential = {
    helper = "/mnt/c/Program\\ Files/Git/mingw64/bin/git-credential-manager.exe";
    "https://dev.azure.com".useHttpPath = true;
  };

  systemd.user.startServices = "sd-switch";
  programs.home-manager.enable = true;

  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.05"; # Please read the comment before changing.
}
