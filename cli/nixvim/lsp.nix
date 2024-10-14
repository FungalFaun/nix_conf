{
  programs.nixvim.plugins = {
    lsp = {
      enable = true;

      servers = {
        ts_ls.enable = true;
        jsonls.enable = true;
        yamlls.enable = true;

        lua_ls = {
          enable = true;
          settings.telemetry.enable = false;
        };
      };
    };
  };
}
