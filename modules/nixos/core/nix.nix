{
  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];

    substituters = [];
    trusted-public-keys = [];
  };
}