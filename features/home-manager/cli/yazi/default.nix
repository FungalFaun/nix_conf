{
  pkgs,
  ...
}:{
  programs.yazi = {
    enable = true;    
    enableZshIntegration = true;

    settings = {
      opener = {
        edit = [
          { run = ''$EDITOR "$@"''; block = true; for = "unix";}
        ];
        
        open = [
          { run = ''xdg-open "$@"''; desc = "Open";}
        ];
      };

    };
  };

  home.packages = with pkgs; [
    ffmpeg-headless
    # 7zip ?
    jq
    poppler
    fd
    ripgrep
    fzf
    zoxide
    resvg
    imagemagick

    xdg-utils
    # Is WSL Wayland compatible?
    # wl-clipboard
    # xclip
  ];
}
