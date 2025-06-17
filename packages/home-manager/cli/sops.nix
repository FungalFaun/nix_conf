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

    defaultSopsFile = ../../../secrets/secrets.yaml;
    defaultSopsFormat = "yaml";
    
    secrets = {
      myget-key = {};
      encryptionkey = {};
      relax-npm-token = {};
    };
  };
}
