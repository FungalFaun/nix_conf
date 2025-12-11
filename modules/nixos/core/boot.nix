{
  lib,
  ...
}: {
  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = lib.mkDefault 10;
        consoleMode = lib.mkDefault "max";
      };

      efi.canTouchEfiVariables = true;
      timeout = lib.mkDefault 8;
    };

    initrd.systemd.enable = true;
  };
}
