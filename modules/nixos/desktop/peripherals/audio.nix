{
  pkgs,
  ...
}: {
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
  
    pulseaudio.enable = false;
  };

  security.rtkit.enable = true;
}