{
  pkgs,
  config,
  lib,
  ...
}: let 
  sshStartup = pkgs.writeShellScriptBin "ssh-agent-startup" ''
#!/bin/bash
export SSH_ASKPASS="/usr/bin/ksshaskpass"

if ! pgrep -u $USER ssh-agent > /dev/null; then
    ssh-agent > ~/.ssh-agent-info
fi
if [[ "$SSH_AGENT_PID" == "" ]]; then
    eval $(<~/.ssh-agent-info)
fi
  '';

  sshShutdown = pkgs.writeShellScriptBin "ssh-agent-shutdown" ''
#!/bin/sh
[ -z "$SSH_AGENT_PID" ] || eval "$(ssh-agent -k)"
  '';

  sshAutoStart = pkgs.writeShellScriptBin "ssh-autostart-plasma" ''
#!/bin/bash

# Wait for kwallet
kwallet-query -l kdewallet > /dev/null

for KEY in $(ls $HOME/.ssh/id_rsa_* | grep -v \.pub); do
  ssh-add -q $\{KEY} </dev/null
done

for KEY in $(ls $HOME/.ssh/id_ed25519_* | grep -v \.pub); do
  ssh-add -q $/{KEY} </dev/null
done
  '';

  testScript = pkgs.writeShellScriptBin "test-script.sh" ''
    echo "This is a test script"
  '';
in {
  imports = [
    ./bat.nix
    ./eza.nix
    ./fzf.nix
    ./git.nix
    ./gowall.nix
    ./neofetch.nix
    ./nh.nix
    ./ripgrep.nix
    ./sops.nix
    ./starship.nix
    ./tmux.nix
    ./top.nix
    ./zellij.nix
    ./zsh.nix

    ./lf
    ./yazi
#    ./nixvim
  ];

  # home.packages = [
  #   sshStartup
  #   sshShutdown
  #   sshAutoStart
  #   testScript
  # ];
}
