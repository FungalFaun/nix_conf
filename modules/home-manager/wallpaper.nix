{
  lib,
  ...
}: let
  inherit (lib) types mkOption;
in {
  options.wallpaper = mkOption {
    type = types.str;
    example = "wallpaper.jpg";
  };

  config = {};
}
