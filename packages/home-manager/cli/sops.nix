{
  pkgs,
  config,
  inputs,
  lib,
  ...
}:
{
  imports = [
    inputs.sops-nix.homeManagerModules.sops
  ];

  home.packages = with pkgs; [
    sops
    age
    ssh-to-age
  ];

  systemd.user.services.mbsync.unitConfig.After = ["sops-nix.service"];

  sops = {
    age.keyFile = "${config.xdg.configHome}/sops/age/keys.txt";
    age.sshKeyPaths = ["${config.home.homeDirectory}/.ssh/id_ed25519"];

    defaultSopsFile = ../../../secrets/secrets.yaml;
    defaultSopsFormat = "yaml";
    
    secrets = {
      "portal/myget-key" = {};
      "portal/encryptionkey" = {};
      "portal/relax-npm-token" = {};
    };
  };
}
