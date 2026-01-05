{
  pkgs,
  ...
}:
{
  fonts = {
    enableDefaultPackages = true;
    fontconfig.useEmbeddedBitmaps = true;
    packages = with pkgs; [
      #noto-fonts
      # noto-fonts-emoji
      noto-fonts-color-emoji
      # nerd-fonts.noto-fonts
      # nerd-fonts.noto-fonts-color-emoji
      nerd-fonts.inconsolata
      nerd-fonts.dejavu-sans-mono
      nerd-fonts.roboto-mono
    ];

    # fontconfig = {
    #  defaultFonts = {
    #    serif = ["Inconsolata Nerd Font"];
    #    sansSerif = ["Inconsolata Nerd Font"]; 
    #    monospace = ["InconsolataGo Mono"];
    #    emoji = ["Noto Color Emoji"];
    #  };
    # };
  };
}
