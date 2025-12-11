{
  pkgs,
  ...
}: {
  # for security reasons, do not load neovim's user config
  # since EDITOR may be used to edit some critical files
  environment = {
    variables.EDITOR = "nvim --clean";
  
    systemPackages = with pkgs; {
      
    };
  };

  
}