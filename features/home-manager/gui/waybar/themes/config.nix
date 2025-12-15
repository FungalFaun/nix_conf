{
  pkgs,
  ...
}:{
  imports = [
    ../modules.nix
  ];
  
  home.packages = with pkgs; [
    font-awesome_7
    font-awesome_6
    material-icons
    nerd-fonts.fira-code
    fira-sans
  ];

  programs.waybar = {
    style = ./style.css;

    settings = {
      mainBar = {
        layer = "top";
        margin-top = 0;
        margin-bottom = 0;
        margin-left = 0;
        margin-right = 0;
        spacing = 0;

        modules-left = [
          # "custom/appmenu"
          "hyprland/workspaces"
          "custom/empty"
        ];
        modules-center = [
          "hyprland/window"
          "custom/empty"
        ];
        modules-right = [
          "pulseaudio"
          "bluetooth"
          "network"
          "battery"
          "group/hardware"
          "group/tools"
          "tray"
          # "custom/notification"
          "custom/exit"
          "clock"
        ];
      };
    };
  };
}
