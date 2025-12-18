{
  lib,
  config,
  ...
}: let 
  cfg = config.modules.bluetooth;
in {
  options.modules.bluetooth = {
    enable = lib.mkEnableOption "Bluetooth";
  };

  config = lib.mkIf cfg.enable {
    hardware =  {
      bluetooth = {
        enable = true;
        powerOnBoot = true;
      };
    };

    services.blueman.enable = true;
  };
}