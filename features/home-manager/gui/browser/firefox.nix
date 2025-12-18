{
#  inputs,
  pkgs,
  ...
}: {
  home.packages = [
    pkgs.vdhcoapp
  ];

  programs.firefox = {
    enable = false;
    profiles.broom = {
      name = "Broom";
      isDefault = true;

#      languagePacks = [
#        "en-US"
#        "nb-NO"
#      ];

      #      search = {
      #        default = "DuckDuckGo";
      #        privateDefault = "DuckDuckGo";
      #      };

      containers = {
        personal = {
          color = "blue";
          icon = "fingerprint";
          id = 1;
        };

        shopping = {
          color = "pink";
          icon = "cart";
          id = 2;
        };

        "F**k TikTok" = {
          color = "yellow";
          icon = "circle";
          id = 3;
        };
      };

      containersForce = true;
#
#      extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
#        bitwarden
#        ublock-origin
#        darkreader
#        youtube-shorts-block
#        tree-style-tab
#        proton-vpn
#        proton-pass
#        privacy-badger
#        multi-account-containers
#        facebook-container
#        enhancer-for-youtube
#        clearurls
#
#      ];


#      settings = {};

#      search.engines = {};

#      bookmarks = [
#        {
#          name = "wikipedia";
#          tags = ["wiki"];
#          keyword = "wiki";
#          url = "";
#        }
#      ];
    };
  };


  xdg.mimeApps.defaultApplications = {
    "text/html" = ["firefox.desktop"];
    "text/xml" = ["firefox.desktop"];
    "x-scheme-handler/http" = ["firefox.desktop"];
    "x-scheme-handler/https" = ["firefox.desktop"];
  };
}
