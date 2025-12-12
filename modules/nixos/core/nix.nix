{
  lib,
  ...
}: {
  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];

      substituters = [];
      trusted-public-keys = [];

      # https://nixos.org/manual/nix/stable/command-ref/conf-file.html#conf-auto-optimise-store
      auto-optimize-store = true;
    };

    gc = {
      automatic = lib.mkDefault true;
      dates = lib.mkDefault "weekly";
      options = lib.mkDefault "--delete-older-than 7d";
    };
  };

  nix.channel.enable = false;

  nixpkgs.config.allowUnfree = true;
}
