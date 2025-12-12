{
  pkgs,
  ...
}: {
# https://github.com/ryan4yin/nix-config/blob/fdcc3be59d13725cd4d93ba5f2beff3d86322f58/modules/nixos/desktop/fhs.nix
  # environment.systemPackages = [
  #   (
  #     let 
  #       base = pkgs.appimageTools.defaultFhsEnvArgs;
  #     in 
  #       pkgs.buildFHSEnv (
  #         base
  #         // {
  #           name = "fhs";
  #           targetPkgs = pkgs: (base.targetPkgs pkgs) ++ [ pkgs.pkg-config ];
  #           profile = "export FHS=1";
  #           runScript = "bash";
  #           extraOutputsToInstall = [ "dev" ];
  #         }
  #       )
  #   )
  # ];

  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      stdenv.cc.cc
    ];
  };
}