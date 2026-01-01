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

      # TEST_SOPS = "$(cat ${config.sops.templates."portal/myget-key".path})";

      MYGET_CUSTOMER_KEY = "$(cat ${config.sops.secrets."portal/myget-key".path})";
      MYGET_RELAX_KEY = "$(cat ${config.sops.secrets."portal/myget-key".path})";
      ENCRYPTEDTOKENCACHE_ENCRYPTIONKEY = "$(cat ${config.sops.secrets."portal/encryptionkey".path})";
      RELAX_NPM_TOKEN = "$(cat ${config.sops.secrets."portal/relax-npm-token".path})";

      SSL_CERT_DIR = "$HOME/.aspnet/dev-certs/trust:/usr/lib/ssl/certs";
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
      z = "zellij";
      y = "yazi";
      dn = "dotnet";

      d = "docker";
      dc = "docker compose";

      cat = "bat";

      hm = "home-manager";

      prtl = "cd ~/dev && zellij --layout ./run_portal.kdl";
    };
  };
}
