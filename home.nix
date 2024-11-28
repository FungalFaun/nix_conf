{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./modules/cli
  ];

  home = {
    username = "broom";
    homeDirectory = "/home/broom";
    
    #sessionPath = [ "$HOME/.local/bin" ];
  };


  home.packages = with pkgs; [
    git
    nixd
    #(pkgs.nerdfonts.override { fonts = [ "Inconsolata" ]; })
  ];

  nix = {
    package = pkgs.nix;
    nixPath = ["nixpkgs=${inputs.nixpkgs}"];
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      warn-dirty = false;
    };
  };

  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.
}
