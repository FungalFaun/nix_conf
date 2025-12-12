# moved
{
  pkgs,
  ...
}: {
  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };

    pulseaudio = {
      enable = true;
    };
  };

  services.blueman = {
    enable = true;
  };
}
