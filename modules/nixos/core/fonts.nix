{
  pkgs,
  config,
  lib,
  ...
}: let 
  cfg = config.modules.desktop;
in {
  options.modules.desktop = {
    fonts.enable = lib.mkEnableOption "Rich fonts - Add NerdFonts, icons & emoji";
  };

  config.fonts = {
    packages = with pkgs; lib.mkIf cfg.fonts.enable [
      material-design-icons
      font-awesome_7

      nerd-fonts.symbols-only
      nerd-fonts.fira-code
      nerd-fonts.inconsolata
      nerd-fonts.jetbrains-mono
      nerd-fonts.iosevka

      noto-fonts
      noto-fonts-color-emoji
    ];
  };
}