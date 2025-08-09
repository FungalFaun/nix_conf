{
  pkgs,
  config,
  ...
}:{
  home.packages = [pkgs.git-credential-manager];

  programs.git = {
    enable = true;

    # To not store name and email in git
    # [user]
    #   name = <name>
    #   email = <email>
    includes = [
      { path = "~/.config/git_extra/user"; }
    ];
    
    aliases = {
      a = "add";
      f = "fetch";
      c = "commit";
      b = "branch";
      s = "status";

      co = "checkout";
      com = "checkout master";
      cob = "checkout -b";
      sw = "switch";

      bd = "branch -d";
      bD = "branch -D";

      cam = "commit -am";
      cr = "reset HEAD~";

      st = "stash";
      stu = "stash --include-untracked";

      ps = "push";
      pl = "pull";

      current = "rev-parse --abbrev-ref HEAD";
      # pso = "!CURRENT=\${git current} && git push --set-upstream origin $CURRENT";

      cp = "!git cherry-pick";

      rc = "!git rebase --continue";
      ra = "!git rebase --abort";
    };

    extraConfig = {
      init.defaultBranch = "master";
      
      credential = {
        helper = "/mnt/c/Program\\ Files/Git/mingw64/bin/git-credential-manager.exe";
        "https://dev.azure.com".useHttpPath = true;
      };
    };

    ignores = [
      ".direnv"
      "result"
    ];
  };
}
