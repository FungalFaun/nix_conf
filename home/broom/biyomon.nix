{
  pkgs,
  inputs,
  outputs,
  ...
}: let
  username = "broom";

  combinedDotnet = with pkgs.dotnetCorePackages; combinePackages [
    sdk_6_0
    sdk_8_0
    sdk_9_0_3xx
    runtime_8_0
  ];
in {
  imports = [
    outputs.homeManagerModules.fonts

    ../../features/home-manager/cli
    ../../features/home-manager/dev/nixvim
    # ../../features/home-manager/gui/font.nix
  ];

  home = {
    username = username;
    homeDirectory = "/home/${username}";
  };

  home.packages = with pkgs; [
    git
    nixd

    unzip
    
    yarn
    nodejs_20
    combinedDotnet
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

  programs.git.settings.credential = {
    helper = "/mnt/c/Program\\ Files/Git/mingw64/bin/git-credential-manager.exe";
    "https://dev.azure.com".useHttpPath = true;
  };

  services = {
    # Bluetooth MIDI controls
    mpris-proxy.enable = true;
  };

  systemd.user.startServices = "sd-switch";
  programs.home-manager.enable = true;

  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.05"; # Please read the comment before changing.
}
