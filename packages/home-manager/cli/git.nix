{
  programs.git = {
    enable = true;
    userName = "Adrian Heide";
    userEmail = "adrian.heide@if.no";

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
    };

    ignores = [
      ".direnv"
      "result"
    ];
  };
}
