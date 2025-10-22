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
    
    settings = {
      init.defaultBranch = "master";

      alias = {
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
        pso = "!CURRENT=$(git branch --show-current) && git push --set-upstream origin $CURRENT";

        cp = "!git cherry-pick";

        rc = "!git rebase --continue";
        ra = "!git rebase --abort";
      };

    };

    ignores = [
      ".direnv"
      "result"
    ];
  };
}
