{
  pkgs,
  config,
  lib,
  ...
}: let
  cfg = config.modules.audio;
in {
  options.modules.audio = {
    enable = lib.mkEnableOption "Audio";
  };

  config = lib.mkIf cfg.enable { 
    services = {
      pipewire = {
        enable = true;
        alsa = {
          enable = true;
          support32Bit = true;
        };
        pulse.enable = true;
        jack.enable = true;
        wireplumber.enable = true;
      };
    
      # Pulseaudio being can interfere with pipewire
      pulseaudio.enable = false;
    };
    
    # But some services depend on pulseaudio
    environment.systemPackages = with pkgs; [
      pulseaudio
    ];

    security.rtkit.enable = true;
  };
}