{
  lib,
  ...
}: {
  nix = {
    settings = {
      auto-optimise-store = lib.mkDefault true;
      experimental-features = [
        "nix-command"
        "flakes"
        # "ca-derivations"
      ];
      warn-dirty = false;
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than +5";
    };
  };
}
