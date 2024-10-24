{
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
            options = {
              home-manager = {
                expr = "(builtins.getFlake /home/broom/.config/home-manager).homeConfigurations.broom.options";
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
