# https://github.com/ryan4yin/nix-config/blob/fdcc3be59d13725cd4d93ba5f2beff3d86322f58/modules/nixos/desktop/security.nix
{
  security.polkit.enable = true;

  services.gnome = {
    gnome-keyring.enable = true;
    gcr-ssh-agent.enable = false;
  };

  programs = {
    seahorse.enable = true;
    ssh.startAgent = true;

    gnupg.agent = {
      enable = true;
      enableSSHSupport = false;
      settings.default-cache-ttl = 4 * 60 * 60;
    };
  };

  security.pam.services.greetd.enableGnomeKeyring = true;
}