{
  ...
}: {
  programs.tmux = {
    enable = true;

    aggressiveResize = true;
    clock24 = true;
    keyMode = "vi";
    customPaneNavigationAndResize = true;

    shortcut = "a";

    extraConfig = ''
      set -g mouse on

      # 2x C-a goes back and forth between most recent windows
      bind-key C-a last-window

      # For NeoVim
      set -g focus-events on
    '';
  };

  home.shellAliases = {
    tm = "tmux";
    tms = "tmux new -s";
    tml = "tmux list-sessions";
    tma = "tmux attach -t";
    tmk = "tmux kill-session -t";
  };
}
