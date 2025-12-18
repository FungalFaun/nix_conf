{
#   pkgs,
#   lib,
#   config,
#   ...
# }: let 
#   cfg = config.modules.periferals;
# in {
#   options.modules.periferals = {
#     enable = lib.mkEnableOption "periferals";
#   };
  
#   config = lib.mkIf cfg.enable {
#     services = {
#       printing.enable = true;

#       udev.packages = with pkgs; [
#         gnome-settings-deamon
#       ];
#     };
# };
}