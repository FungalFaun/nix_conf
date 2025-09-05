
{
  inputs,
  pkgs,
  ...
}: let
  lock-true = {
    Value = true;
    Status = "locked";
  };
  lock-false = {
    Value = false;
    Status = "locked";
  };
in {
  home.packages = [
    pkgs.vdhcoapp
  ];

  programs.librewolf = {
    enable = true;
    profiles.broom = {
      name = "Broom";
      isDefault = true;

      # languagePacks = [
      #   "en-US"
      #   "nb-NO"
      # ];

      # search = {
      #   default = "DuckDuckGo";
      #   privateDefault = "DuckDuckGo";
      # };

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

      # extensions.packages = with inputs.firefox-addons.packages."x86_64-linux"; [
      #   bitwarden
      #   privacy-badger
      #   ublock-origin
      #   darkreader
      #   youtube-shorts-block
      #   proton-vpn
      #   proton-pass
      #   privacy-badger
      #
      #   facebook-container
      #   # enhancer-for-youtube
      #   clearurls
      #   # vdhcoapp
      #   # temp-mail
      #
      #   #tree-style-tab
      #   #multi-account-containers # Default installed on LibreWolf
      # ];
      #

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

    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      EnableTrackingProtection = {
        Value= true;
        Locked = false;
        Cryptomining = true;
        Fingerprinting = true;
      };
      DisablePocket = true;
      DisableFirefoxAccounts = true;
      DisableAccounts = true;
      #DisableFirefoxScreenshots = true;
      OverrideFirstRunPage = "";
      OverridePostUpdatePage = "";
      DontCheckDefaultBrowser = true;
      DisplayBookmarksToolbar = "newtab"; # alternatives: "always" or "newtab"
      DisplayMenuBar = "default-off"; # alternatives: "always", "never" or "default-on"
      SearchBar = "unified"; # alternative: "separate"

      # ExtensionSettings = {
        # "*".installation_mode = "blocked"; # blocks all addons except the ones specified below

        # # uBlock Origin:
        # "uBlock0@raymondhill.net" = {
        #   install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
        #   installation_mode = "force_installed";
        # };
        # # Privacy Badger:
        # "jid1-MnnxcxisBPnSXQ@jetpack" = {
        #   install_url = "https://addons.mozilla.org/firefox/downloads/latest/privacy-badger17/latest.xpi";
        #   installation_mode = "force_installed";
        # };
      # };
    };
  };

  xdg.mimeApps.defaultApplications = {
    "text/html" = ["librewolf.desktop"];
    "text/xml" = ["librewolf.desktop"];
    "x-scheme-handler/http" = ["librewolf.desktop"];
    "x-scheme-handler/https" = ["librewolf.desktop"];
  };
}
