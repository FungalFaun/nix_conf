{
  imports = [
    ./bluetooth.nix
    ./boot.nix
    ./filemanager.nix
    ./fonts.nix
    ./gdm.nix
    ./locale.nix
    ./networking.nix
    ./nix-ld.nix
    ./nix.nix
    ./pipewire.nix
    # ./sddm.nix
    ./swayosd-server.nix
    ./usb.nix
  ];

  # for KDE Plasma
  # https://unix.stackexchange.com/questions/724894/how-do-i-set-up-kde-kwallet-and-ssh-so-im-not-asked-to-enter-my-ssh-passphrase
  systemd.services = {
    ssh-agent = {
      description = "SSH key agent";
      wantedBy = "default.target";
      
      serviceConfig = {
        Type = "simple";
        Environment = "SSH_AUTH_SOCK=%t/ssh-agent.socket";
        ExecStart = "/usr/bin/ssh-agent -D -a $SSH_AUTH_SOCK";
      };
    };
  };

# [Unit]
# Description=SSH key agent

# [Service]
# Type=simple
# Environment=SSH_AUTH_SOCK=%t/ssh-agent.socket
# ExecStart=/usr/bin/ssh-agent -D -a $SSH_AUTH_SOCK

# [Install]
# WantedBy=default.target
}
