
{ 
  config, 
  lib, 
  pkgs, 
  inputs, 
  ... 
}: {
  imports = [
    # include NixOS-WSL modules
    inputs.nixos-wsl.nixosModules.wsl
    ../users/adrian.nix
    ../../features/nixos/common/nix-ld.nix
    ../../features/nixos/common/fonts.nix
  ];

  wsl = {
    enable = true;
    defaultUser = "adrian";

    wslConf = {
      network.hostname = "iftech";
    };
  };

  nixpkgs = {
    hostPlatform = "x86_64-linux";
    config = {
      allowUnfree = true;
      permittedInsecurePackages = [
        "dotnet-sdk-6.0.428"
      ];
    };
  };

  environment.systemPackages = with pkgs; [
    neovim
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?
}
