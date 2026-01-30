{
  programs.zsh = {
    enable = true;

    enableCompletion = true;
    autocd = true;

    sessionVariables = {
      EDITOR = "nvim";

      SSL_CERT_DIR = "$HOME/.aspnet/dev-certs/trust:/usr/lib/ssl/certs";
    };

    shellAliases = {
      ls = "eza";
      l = "eza -lh";
      ll = "eza -lh --time-style='long-iso'";
      la = "eza -lha --time-style='long-iso'";
      laa = "eza -lhag --time-style='long-iso'";
      lt = "eza -lhT --time-style='long-iso' --level=2";

      nv = "nvim";
      mv = "mv -i";
      rm = "rm -i";

      g = "git";
      z = "zellij";
      y = "yazi";
      dn = "dotnet";

      d = "docker";
      dc = "docker compose";

      k = "kubectl";
      kns = "kubectl-ns";
      kx = "kubectl-ctx";

      cat = "bat";

      hm = "home-manager";

      prtl = "cd ~/dev && zellij --layout ./run_portal.kdl";
    };
  };
}
