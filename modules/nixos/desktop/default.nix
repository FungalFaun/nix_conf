{
  pkgs,
  ...
}: {
  imports = [
    
  ];

  users.defaultUserShell = pkgs.zsh;

  security.sudo.keepTerminfo = true;

  services = {
    gvfs.enable = true;
    tumbler.enable = true;
  };

  programs = {
    dconf.enable = true;
  };
}