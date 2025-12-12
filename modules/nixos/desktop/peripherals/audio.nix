{
  pkgs,
  ...
}: {
  # Some services depend on pulseaudio
  environment.systemPackages = with pkgs; [
    pulseaudio
  ];

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
  
    # Pulseaudio being  can interfere with pipewire
    pulseaudio.enable = false;
  };

  security.rtkit.enable = true;
}