{
  lib,
  ...
}:{
  programs.starship = {
    enable = true;
    settings = let
      gruvbox = {
        fg0 = "#fbf1c7";
        bg1 = "#3c3836";
        bg3 = "#665c54";
        blue = "#458588";
        aqua = "#689d6a";
        green = "#98971a";
        orange = "#d65d0e";
        purple = "#b16286";
        red = "#cc241d";
        yellow = "#d79921";
      };
    in {
      format = lib.concatStrings [
        "[](${gruvbox.orange})"
        "$os"
        "$username"
        "[](bg:${gruvbox.yellow} fg:${gruvbox.orange})"
        "$directory"
        "[](fg:${gruvbox.yellow} bg:${gruvbox.aqua})"
        "$git_branch"
        "$git_status"
        "[](fg:${gruvbox.aqua} bg:${gruvbox.blue})"
        "$nix_shell"
        "$rust"
        "$golang"
        "$nodejs"
        "$python"
        "[](fg:${gruvbox.blue} bg:${gruvbox.bg3})"
        "$docker_context"
        "[](fg:${gruvbox.bg3} bg:${gruvbox.bg1})"
        "$time"
        "[ ](fg:${gruvbox.bg1})"
        "$line_break$character"
      ];

      os = {
        disabled = false;
        style = "bg:${gruvbox.orange} fg:${gruvbox.fg0}";

        symbols = {
          NixOS = "";
          Windows = "󰍲";
          Ubuntu = "󰕈";
          SUSE = "";
          Raspbian = "󰐿";
          Mint = "󰣭";
          Macos = "󰀵";
          Manjaro = "";
          Linux = "󰌽";
          Gentoo = "󰣨";
          Fedora = "󰣛";
          Alpine = "";
          Amazon = "";
          Android = "";
          Arch = "󰣇";
          Artix = "󰣇";
          EndeavourOS = "";
          CentOS = "";
          Debian = "󰣚";
          Redhat = "󱄛";
          RedHatEnterprise = "󱄛";
          Pop = "";
        };
      };

      username = {
        show_always = true;
        style_user = "bg:${gruvbox.orange} fg:${gruvbox.fg0}";
        style_root = "bg:${gruvbox.orange} fg:${gruvbox.fg0}";
        format = "[ $user ]($style)";
      };

      directory = {
        style = "fg:${gruvbox.fg0} bg:${gruvbox.yellow}";
        format = "[ $path ]($style)";
        truncation_length = 3;
        truncation_symbol = "…/";
      };

      git_branch = {
        symbol = "";
        style = "bg:${gruvbox.aqua}";
        format = "[[ $symbol $branch ](fg:${gruvbox.fg0} bg:${gruvbox.aqua})]($style)";
        ignore_branches = [
          "master"
        ];
      };

      git_status = {
        style = "bg:${gruvbox.aqua}";
        format = "[[($all_status $ahead_behind )](fg:${gruvbox.fg0} bg:${gruvbox.aqua})]($style)";
      };

      nodejs = {
        symbol = "";
        style = "bg:${gruvbox.blue}";
        format = "[[ $symbol( $version) ](fg:${gruvbox.fg0} bg:${gruvbox.blue})]($style)";
      };

      nix_shell = {
        symbol = "";
        style = "bg:${gruvbox.blue}";
        format = "[[ $symbol( $version) ](fg:${gruvbox.fg0} bg:${gruvbox.blue})]($style)";
      };

      rust = {
        symbol = "";
        style = "bg:${gruvbox.blue}";
        format = "[[ $symbol( $version) ](fg:${gruvbox.fg0} bg:${gruvbox.blue})]($style)";
      };

      golang = {
        symbol = "";
        style = "bg:${gruvbox.blue}";
        format = "[[ $symbol( $version) ](fg:${gruvbox.fg0} bg:${gruvbox.blue})]($style)";
      };

      python = {
        symbol = "";
        style = "bg:${gruvbox.blue}";
        format = "[[ $symbol( $version) ](fg:${gruvbox.fg0} bg:${gruvbox.blue})]($style)";
      };

      docker_context = {
        symbol = "";
        style = "bg:${gruvbox.bg3}";
        format = "[[ $symbol( $context) ](fg:#83a598 bg:${gruvbox.bg3})]($style)";
      };
      
      time = {
        disabled = false;
        time_format = "%R";
        style = "bg:${gruvbox.bg1}";
        format = "[[  $time ](fg:${gruvbox.fg0} bg:${gruvbox.bg1})]($style)";
      };

      line_break = {
        disabled = false;
      };

      character = {
        disabled = false;
        # success_symbol = "[](bold fg:${gruvbox.green})";
        # error_symbol = "[](bold fg:${gruvbox.red})";
        # vimcmd_symbol = "[](bold fg:${gruvbox.green})";
        # vimcmd_replace_one_symbol = "[](bold fg:${gruvbox.purple})";
        # vimcmd_replace_symbol = "[](bold fg:${gruvbox.purple})";
        # vimcmd_visual_symbol = "[](bold fg:${gruvbox.yellow})";
      };
    };
  };
}
