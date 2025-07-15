{
  programs.nixvim = {
    plugins = {
      comment = {
        enable = true;
        settings = {
          padding = true;

          toggler = {
            line = "tl";
            block = "tb";
          };

          opleader = {
            line = "tl";
            block = "tb";
          };
        };
      };
    };
  };
}
