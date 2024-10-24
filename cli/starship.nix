{
  programs.starship = {
    enable = true;
    settings = let
      colors = ["#a3aed2" "#769ff0" "#394260" "#212736" "#1d2230"];
    in {
      git_branch = {
        symbol = "";
        style = "bg:${builtins.elemAt colors 2}";
        truncation_length = 25;
        only_attached = true;
        format = "[[ $symbol $branch ](fg:${builtins.elemAt colors 1} bg:${builtins.elemAt colors 2})]($style)";
      };
    };
  };
}
