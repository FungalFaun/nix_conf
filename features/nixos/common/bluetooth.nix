# moved
{
  pkgs,
  ...
}: {
  environment.systemPackages = [
    pkgs.pulseaudio
  ];

  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };

    pulseaudio = {
      enable = false;
    };
  };

  services.blueman = {
    enable = true;
  };
}
