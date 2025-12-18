# https://github.com/ryan4yin/nix-config/blob/fdcc3be59d13725cd4d93ba5f2beff3d86322f58/modules/nixos/desktop/security.nix

{
  pkgs,
  config,
  lib,
  ...
}: let
  cfg = config.modules.desktop.security;
in {
  options.modules.desktop.security = {
    enable = lib.mkEnableOption "SSH agent";
  };
    
  config = lib.mkIf cfg.enable {
    security.polkit.enable = true;

    services.gnome = {
      gnome-keyring.enable = true;
      gcr-ssh-agent.enable = false;
    };

    programs = {
      seahorse.enable = true;

      gnupg.agent = {
        enable = true;
        enableSSHSupport = false;
        settings.default-cache-ttl = 4 * 60 * 60;
      };
    };

    # The OpenSSH agent remembers private keys for you
    # so that you don’t have to type in passphrases every time you make an SSH connection.
    # Use `ssh-add` to add a key to the agent.
    programs.ssh.startAgent = true;
    security.pam.services.greetd.enableGnomeKeyring = true;
  };
}