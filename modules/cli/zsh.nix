{
  lib,
  config,
  ...
}: let
  inherit (lib) mkIf;
  packageNames = map (p: p.pname or p.name or null) config.home.packages;
  hasPackage = name: lib.any (x: x == name) packageNames;
  hasEza = hasPackage "eza";
in {
  programs.zsh = {
    enable = true;

    enableCompletion = true;
    autocd = true;

    sessionVariables = {
      EDITOR = "nvim";
    };

    shellAliases = {
      ls = mkIf hasEza "eza";
      l = mkIf hasEza "eza -lh";
      ll = mkIf hasEza "eza -lh --time-style='long-iso'";
      la = mkIf hasEza "eza -lha --time-style='long-iso'";
      laa = mkIf hasEza "eza -lhag --time-style='long-iso'";
      lt = mkIf hasEza "eza -lhT --time-style='long-iso' --level=2";

      nv = "nvim";
      mv = "mv -i";
      rm = "rm -i";

      g = "git";

      d = "docker";
      dc = "docker compose";

      cat = "bat";

      hms = "home-manager switch --flake $HOME/.config/home-manager";
      nrs = "nixos-rebuild switch --flake $HOME/system/#tux";
    };
  };
}
