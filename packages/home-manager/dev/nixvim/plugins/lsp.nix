let
  username = "faun";
in{
  programs.nixvim.plugins = {
    lsp = {
      enable = true;

      servers = {
        ts_ls.enable = true;
        jsonls.enable = true;
        yamlls.enable = true;

        nixd = {
          enable = true;
          autostart = true;
          settings = {
            formatting.command = ["alejandra"];
            # nixpkgs.expr = "import <nixpkgs> { }";
            options = {
              nixos = {
                expr = ''(builtins.getFlake "/home/${username}/.config/home-manager").nixosConfigurations.${username}.options'';
              };
              home-manager = {
                expr = ''(builtins.getFlake "/home/${username}/.config/home-manager").homeConfigurations.${username}.options'';
                
              };
            };
          };
        };

        lua_ls = {
          enable = true;
          settings.telemetry.enable = false;
        };
      };
    };
  };
}
