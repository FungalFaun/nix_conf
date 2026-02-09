{
  lib,
  ...
}: {
  programs = {
    direnv = {
      enable = lib.mkDefault false;
      enableZshIntegration = true;
      nix-direnv.enable = true;
      silent = true;

      config = {
        global = {
          # load_dotenv = true;
          strict_env = true;
        };
      };
    };
  };
}