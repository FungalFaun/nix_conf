{
  pkgs,
  vars,
  config,
  ...
}: let
  inherit (vars) username;
  ifTheyExist = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in {
  users = {
    mutableUsers = false;
    defaultUserShell = pkgs.zsh;

    users."${username}" = {
      home = "/home/${username}";
      isNormalUser = true;
      extraGroups = ifTheyExist [
        username
        "users"
        "wheel"
        "networkmanager"
        "wireshark"
        "audio"
        "video"
        "gamemode"
      ];
    };

    useDefaultShell = true;

    groups = {

    };
  };
  
  programs = {
    zsh.enable = true;
    bash.enable = false;
  };
}