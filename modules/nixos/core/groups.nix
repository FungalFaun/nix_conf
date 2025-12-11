{
  vars,
  config,
  ...
}: let
  inherit (vars) username;
in {
  users.mutableUsers = false;

  users.groups = {
  };

  users.users."${username}" = {
    home = "/home/${username}";
    isNormalUser = true;
    extraGroups = [
      username
      "users"
      "wheel"
      "networkmanager"
      "wireshark"
    ];
  };
}