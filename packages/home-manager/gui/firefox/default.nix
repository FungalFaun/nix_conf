{
#  inputs,
  ...
}: {
  programs.firefox = {
    enable = true;
#    profile.broom = {
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
#    };
  };

  xdg.mimeApps.defaultApplications = {
    "text/html" = ["firefox.desktop"];
    "text/xml" = ["firefox.desktop"];
    "x-scheme-handler/http" = ["firefox.desktop"];
    "x-scheme-handler/https" = ["firefox.desktop"];
  };
}
