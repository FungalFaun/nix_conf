{
  programs.plasma = {
    enable = true;
    shortcuts = {
      ActivityManager.switch-to-activity-2fd5fa27-c597-4774-b8cb-27219e354030 = [ ];

      "KDE Keyboard Layout Switcher"."Switch to Last-Used Keyboard Layout" = "Meta+Alt+L";
      "KDE Keyboard Layout Switcher"."Switch to Next Keyboard Layout" = "Meta+Alt+K";

      kaccess."Toggle Screen Reader On and Off" = "Meta+Alt+S";

      kmix = {
        decrease_microphone_volume = "Microphone Volume Down";
        decrease_volume = "Volume Down";
        decrease_volume_small = "Shift+Volume Down";
        increase_microphone_volume = "Microphone Volume Up";
        increase_volume = "Volume Up";
        increase_volume_small = "Shift+Volume Up";
        mic_mute = ["Microphone Mute" "Meta+Volume Mute"];
        mute = "Volume Mute";
      };

      ksmserver = {
        "Halt Without Confirmation" = [ ];
        "Lock Session" = ["Meta+L" "Screensaver"];
        "Log Out" = "Ctrl+Alt+Del";
        "Log Out Without Confirmation" = [ ];
        LogOut = [ ];
        Reboot = [ ];
        "Reboot Without Confirmation" = [ ];
        "Shut Down" = [ ];
      };

      kwin = {
        "Activate Window Demanding Attention" = "Meta+Ctrl+A";
        "Cycle Overview" = [ ];
        "Cycle Overview Opposite" = [ ];
        "Decrease Opacity" = [ ];
        "Edit Tiles" = "Meta+T";
        Expose = "Ctrl+F9";
        ExposeAll = ["Ctrl+F10" "Launch (C)"];
        ExposeClass = "Ctrl+F7";
        ExposeClassCurrentDesktop = [ ];
        "Grid View" = "Meta+G";
        "Increase Opacity" = [ ];
        "Kill Window" = "Meta+Ctrl+Esc";
        "Move Tablet to Next Output" = [ ];
        MoveMouseToCenter = "Meta+F6";
        MoveMouseToFocus = "Meta+F5";
        MoveZoomDown = [ ];
        MoveZoomLeft = [ ];
        MoveZoomRight = [ ];
        MoveZoomUp = [ ];
        Overview = "Meta+W";
        "Setup Window Shortcut" = [ ];
        "Show Desktop" = "Meta+D";
        "Switch One Desktop Down" = "Meta+Ctrl+Down";
        "Switch One Desktop Up" = "Meta+Ctrl+Up";
        "Switch One Desktop to the Left" = "Meta+Ctrl+Left";
        "Switch One Desktop to the Right" = "Meta+Ctrl+Right";
        "Switch Window Down" = "Meta+Alt+Down";
        "Switch Window Left" = "Meta+Alt+Left";
        "Switch Window Right" = "Meta+Alt+Right";
        "Switch Window Up" = "Meta+Alt+Up";
        "Switch to Desktop 1" = "Ctrl+F1";
        "Switch to Desktop 10" = [ ];
        "Switch to Desktop 11" = [ ];
        "Switch to Desktop 12" = [ ];
        "Switch to Desktop 13" = [ ];
        "Switch to Desktop 14" = [ ];
        "Switch to Desktop 15" = [ ];
        "Switch to Desktop 16" = [ ];
        "Switch to Desktop 17" = [ ];
        "Switch to Desktop 18" = [ ];
        "Switch to Desktop 19" = [ ];
        "Switch to Desktop 2" = "Ctrl+F2";
        "Switch to Desktop 20" = [ ];
        "Switch to Desktop 3" = "Ctrl+F3";
        "Switch to Desktop 4" = "Ctrl+F4";
        "Switch to Desktop 5" = [ ];
        "Switch to Desktop 6" = [ ];
        "Switch to Desktop 7" = [ ];
        "Switch to Desktop 8" = [ ];
        "Switch to Desktop 9" = [ ];
        "Switch to Next Desktop" = [ ];
        "Switch to Next Screen" = [ ];
        "Switch to Previous Desktop" = [ ];
        "Switch to Previous Screen" = [ ];
        "Switch to Screen 0" = [ ];
        "Switch to Screen 1" = [ ];
        "Switch to Screen 2" = [ ];
        "Switch to Screen 3" = [ ];
        "Switch to Screen 4" = [ ];
        "Switch to Screen 5" = [ ];
        "Switch to Screen 6" = [ ];
        "Switch to Screen 7" = [ ];
        "Switch to Screen Above" = [ ];
        "Switch to Screen Below" = [ ];
        "Switch to Screen to the Left" = [ ];
        "Switch to Screen to the Right" = [ ];
        "Toggle Night Color" = [ ];
        "Toggle Window Raise/Lower" = [ ];
        "Walk Through Windows" = "Alt+Tab";
        "Walk Through Windows (Reverse)" = "Alt+Shift+Tab";
        "Walk Through Windows Alternative" = [ ];
        "Walk Through Windows Alternative (Reverse)" = [ ];
        "Walk Through Windows of Current Application" = "Alt+`";
        "Walk Through Windows of Current Application (Reverse)" = "Alt+~";
        "Walk Through Windows of Current Application Alternative" = [ ];
        "Walk Through Windows of Current Application Alternative (Reverse)" = [ ];
        "Window Above Other Windows" = [ ];
        "Window Below Other Windows" = [ ];
        "Window Close" = "Alt+F4";
        "Window Custom Quick Tile Bottom" = [ ];
        "Window Custom Quick Tile Left" = [ ];
        "Window Custom Quick Tile Right" = [ ];
        "Window Custom Quick Tile Top" = [ ];
        "Window Fullscreen" = [ ];
        "Window Grow Horizontal" = [ ];
        "Window Grow Vertical" = [ ];
        "Window Lower" = [ ];
        "Window Maximize" = "Meta+PgUp";
        "Window Maximize Horizontal" = [ ];
        "Window Maximize Vertical" = [ ];
        "Window Minimize" = "Meta+PgDown";
        "Window Move" = [ ];
        "Window Move Center" = [ ];
        "Window No Border" = [ ];
        "Window On All Desktops" = [ ];
        "Window One Desktop Down" = "Meta+Ctrl+Shift+Down";
        "Window One Desktop Up" = "Meta+Ctrl+Shift+Up";
        "Window One Desktop to the Left" = "Meta+Ctrl+Shift+Left";
        "Window One Desktop to the Right" = "Meta+Ctrl+Shift+Right";
        "Window One Screen Down" = [ ];
        "Window One Screen Up" = [ ];
        "Window One Screen to the Left" = [ ];
        "Window One Screen to the Right" = [ ];
        "Window Operations Menu" = "Alt+F3";
        "Window Pack Down" = [ ];
        "Window Pack Left" = [ ];
        "Window Pack Right" = [ ];
        "Window Pack Up" = [ ];
        "Window Quick Tile Bottom" = "Meta+Down";
        "Window Quick Tile Bottom Left" = [ ];
        "Window Quick Tile Bottom Right" = [ ];
        "Window Quick Tile Left" = "Meta+Left";
        "Window Quick Tile Right" = "Meta+Right";
        "Window Quick Tile Top" = "Meta+Up";
        "Window Quick Tile Top Left" = [ ];
        "Window Quick Tile Top Right" = [ ];
        "Window Raise" = [ ];
        "Window Resize" = [ ];
        "Window Shade" = [ ];
        "Window Shrink Horizontal" = [ ];
        "Window Shrink Vertical" = [ ];
        "Window to Desktop 1" = [ ];
        "Window to Desktop 10" = [ ];
        "Window to Desktop 11" = [ ];
        "Window to Desktop 12" = [ ];
        "Window to Desktop 13" = [ ];
        "Window to Desktop 14" = [ ];
        "Window to Desktop 15" = [ ];
        "Window to Desktop 16" = [ ];
        "Window to Desktop 17" = [ ];
        "Window to Desktop 18" = [ ];
        "Window to Desktop 19" = [ ];
        "Window to Desktop 2" = [ ];
        "Window to Desktop 20" = [ ];
        "Window to Desktop 3" = [ ];
        "Window to Desktop 4" = [ ];
        "Window to Desktop 5" = [ ];
        "Window to Desktop 6" = [ ];
        "Window to Desktop 7" = [ ];
        "Window to Desktop 8" = [ ];
        "Window to Desktop 9" = [ ];
        "Window to Next Desktop" = [ ];
        "Window to Next Screen" = "Meta+Shift+Right";
        "Window to Previous Desktop" = [ ];
        "Window to Previous Screen" = "Meta+Shift+Left";
        "Window to Screen 0" = [ ];
        "Window to Screen 1" = [ ];
        "Window to Screen 2" = [ ];
        "Window to Screen 3" = [ ];
        "Window to Screen 4" = [ ];
        "Window to Screen 5" = [ ];
        "Window to Screen 6" = [ ];
        "Window to Screen 7" = [ ];
        disableInputCapture = "Meta+Shift+Esc";
        view_actual_size = "Meta+0";
        view_zoom_in = ["Meta++" "Meta+="];
        view_zoom_out = "Meta+-";
      };

      mediacontrol = {
        mediavolumedown = [ ];
        mediavolumeup = [ ];
        nextmedia = "Media Next";
        pausemedia = "Media Pause";
        playmedia = [ ];
        playpausemedia = "Media Play";
        previousmedia = "Media Previous";
        stopmedia = "Media Stop";
      };

      org_kde_powerdevil = {
        "Decrease Keyboard Brightness" = "Keyboard Brightness Down";
        "Decrease Screen Brightness" = "Monitor Brightness Down";
        "Decrease Screen Brightness Small" = "Shift+Monitor Brightness Down";
        Hibernate = "Hibernate";
        "Increase Keyboard Brightness" = "Keyboard Brightness Up";
        "Increase Screen Brightness" = "Monitor Brightness Up";
        "Increase Screen Brightness Small" = "Shift+Monitor Brightness Up";
        PowerDown = "Power Down";
        PowerOff = "Power Off";
        Sleep = "Sleep";
        "Toggle Keyboard Backlight" = "Keyboard Light On/Off";
        "Turn Off Screen" = [ ];
        powerProfile = ["Battery" "Meta+B"];
      };

      plasmashell = {
        "Slideshow Wallpaper Next Image" = [ ];
        "activate application launcher" = ["Meta" "Alt+F1"];
        "activate task manager entry 1" = "Meta+1";
        "activate task manager entry 2" = "Meta+2";
        "activate task manager entry 3" = "Meta+3";
        "activate task manager entry 4" = "Meta+4";
        "activate task manager entry 5" = "Meta+5";
        "activate task manager entry 6" = "Meta+6";
        "activate task manager entry 7" = "Meta+7";
        "activate task manager entry 8" = "Meta+8";
        "activate task manager entry 9" = "Meta+9";
        "activate task manager entry 10" = [ ];

        clear-history = [ ];
        clipboard_action = "Meta+Ctrl+X";
        cycle-panels = "Meta+Alt+P";
        cycleNextAction = [ ];
        cyclePrevAction = [ ];
        edit_clipboard = [ ];
        "manage activities" = "Meta+Q";
        "next activity" = "Meta+A";
        "previous activity" = "Meta+Shift+A";
        repeat_action = [ ];
        "show dashboard" = "Ctrl+F12";
        show-barcode = [ ];
        show-on-mouse-pos = "Meta+V";
        "stop current activity" = "Meta+S";
        "switch to next activity" = [ ];
        "switch to previous activity" = [ ];
        "toggle do not disturb" = [ ];
      };
    };
    
    configFile = {

      baloofilerc = {
        General.dbVersion = 2;
        General."exclude filters" = "*~,*.part,*.o,*.la,*.lo,*.loT,*.moc,moc_*.cpp,qrc_*.cpp,ui_*.h,cmake_install.cmake,CMakeCache.txt,CTestTestfile.cmake,libtool,config.status,confdefs.h,autom4te,conftest,confstat,Makefile.am,*.gcode,.ninja_deps,.ninja_log,build.ninja,*.csproj,*.m4,*.rej,*.gmo,*.pc,*.omf,*.aux,*.tmp,*.po,*.vm*,*.nvram,*.rcore,*.swp,*.swap,lzo,litmain.sh,*.orig,.histfile.*,.xsession-errors*,*.map,*.so,*.a,*.db,*.qrc,*.ini,*.init,*.img,*.vdi,*.vbox*,vbox.log,*.qcow2,*.vmdk,*.vhd,*.vhdx,*.sql,*.sql.gz,*.ytdl,*.tfstate*,*.class,*.pyc,*.pyo,*.elc,*.qmlc,*.jsc,*.fastq,*.fq,*.gb,*.fasta,*.fna,*.gbff,*.faa,po,CVS,.svn,.git,_darcs,.bzr,.hg,CMakeFiles,CMakeTmp,CMakeTmpQmake,.moc,.obj,.pch,.uic,.npm,.yarn,.yarn-cache,__pycache__,node_modules,node_packages,nbproject,.terraform,.venv,venv,core-dumps,lost+found";
        General."exclude filters version" = 9;
      };

      dolphinrc.General.ViewPropsTimestamp = "2026,1,1,18,24,16.004";
      dolphinrc."KFileDialog Settings"."Places Icons Auto-resize" = false;
      dolphinrc."KFileDialog Settings"."Places Icons Static Size" = 22;
      
      kactivitymanagerdrc.Plugins."org.kde.ActivityManager.ResourceScoringEnabled" = false;
      kactivitymanagerdrc.activities."2fd5fa27-c597-4774-b8cb-27219e354030" = "Default";
      kactivitymanagerdrc.main.currentActivity = "2fd5fa27-c597-4774-b8cb-27219e354030";

      kcminputrc = {
        "Libinput/2362/597/UNIW0001:00 093A:0255 Mouse".NaturalScroll = true;
        "Libinput/2362/597/UNIW0001:00 093A:0255 Touchpad".ClickMethod = 2;
        "Libinput/2362/597/UNIW0001:00 093A:0255 Touchpad".Enabled = true;
        "Libinput/2362/597/UNIW0001:00 093A:0255 Touchpad".NaturalScroll = true;
        "Libinput/2362/597/UNIW0001:00 093A:0255 Touchpad".TapToClick = false;
        Mouse.cursorTheme = "Breeze_Light";
      };

      kded5rc.Module-device_automounter.autoload = false;

      kdeglobals = {
        General.UseSystemBell = true;
        Icons.Theme = "Gruvbox-Plus-Light";
        KDE.widgetStyle = "Fusion";

        "KFileDialog Settings" = {
          "Allow Expansion" = false;
          "Automatically select filename extension" = true;
          "Breadcrumb Navigation" = true;
          "Decoration position" = 2;
          "Show Full Path" = false;
          "Show Inline Previews" = true;
          "Show Preview" = false;
          "Show Speedbar" = true;
          "Show hidden files" = false;
          "Sort by" = "Name";
          "Sort directories first" = true;
          "Sort hidden files last" = false;
          "Sort reversed" = false;
          "Speedbar Width" = 140;
          "View Style" = "DetailTree";
        };

        WM = {
          activeBackground = "39,39,39";
          activeBlend = "235,219,178";
          activeForeground = "235,219,178";
          inactiveBackground = "40,40,40";
          inactiveBlend = "60,56,54";
          inactiveForeground = "204,190,155";
        };
      };

      klipperrc.General.IgnoreImages = false;

      kwalletrc.Wallet."First Use" = false;

      kwinrc = {
        Desktops = {
          Id_1 = "671f4a3e-2b65-4b9c-b36e-2227c6787776";
          Id_2 = "a93ca321-2860-486b-a09a-a7786de55b43";
          Id_3 = "b023873e-5a72-41d3-bcec-7ff5546f4a98";
          Id_4 = "0a24d0d8-fefe-48c5-98bb-47ec8b38436a";
          Number = 4;
          Rows = 1;
        };

        NightColor.NightTemperature = 3200;
        Plugins.shakecursorEnabled = false;
        Tiling.padding = 4;

        "Tiling/04b13fce-5361-49d2-820e-df0ac0c9e6bb/d816950b-9996-4fe0-bb60-594438016476".tiles = "{\"layoutDirection\":\"horizontal\",\"tiles\":[{\"width\":0.25},{\"width\":0.5},{\"width\":0.25}]}";
        "Tiling/0a24d0d8-fefe-48c5-98bb-47ec8b38436a/d816950b-9996-4fe0-bb60-594438016476".tiles = "{\"layoutDirection\":\"horizontal\",\"tiles\":[{\"width\":0.25},{\"width\":0.5},{\"width\":0.25}]}";
        "Tiling/5ead60a8-968f-492f-a67c-a984b3d08577/d816950b-9996-4fe0-bb60-594438016476".tiles = "{\"layoutDirection\":\"horizontal\",\"tiles\":[{\"width\":0.25},{\"width\":0.5},{\"width\":0.25}]}";
        "Tiling/61aa66c8-74fe-51a6-8c1d-802ac19a91b7".tiles = "{\"layoutDirection\":\"horizontal\",\"tiles\":[{\"width\":0.25},{\"width\":0.5},{\"width\":0.25}]}";
        "Tiling/671f4a3e-2b65-4b9c-b36e-2227c6787776/d816950b-9996-4fe0-bb60-594438016476".tiles = "{\"layoutDirection\":\"horizontal\",\"tiles\":[{\"width\":0.25},{\"width\":0.5},{\"width\":0.25}]}";
        "Tiling/757e6977-e586-42fc-8961-d5a4ce997816/d816950b-9996-4fe0-bb60-594438016476".tiles = "{\"layoutDirection\":\"horizontal\",\"tiles\":[{\"width\":0.25},{\"width\":0.5},{\"width\":0.25}]}";
        "Tiling/77ad310d-78f1-49e6-8b8e-6a4b053ebb90/d816950b-9996-4fe0-bb60-594438016476".tiles = "{\"layoutDirection\":\"horizontal\",\"tiles\":[{\"width\":0.25},{\"width\":0.5},{\"width\":0.25}]}";
        "Tiling/a93ca321-2860-486b-a09a-a7786de55b43/d816950b-9996-4fe0-bb60-594438016476".tiles = "{\"layoutDirection\":\"horizontal\",\"tiles\":[{\"width\":0.25},{\"width\":0.5},{\"width\":0.25}]}";
        "Tiling/b023873e-5a72-41d3-bcec-7ff5546f4a98/d816950b-9996-4fe0-bb60-594438016476".tiles = "{\"layoutDirection\":\"horizontal\",\"tiles\":[{\"width\":0.25},{\"width\":0.5},{\"width\":0.25}]}";

        Wayland.EnablePrimarySelection = false;
        Xwayland.Scale = 1.6;
        "org.kde.kdecoration2".theme = "Breeze";
      };
      
      plasma-localerc.Formats.LANG = "en_US.UTF-8";

      plasmanotifyrc = {
        "Applications/LycheeSlicer".Seen = true;
        "Applications/librewolf".Seen = true;
        "Applications/org.telegram.desktop".Seen = true;
        "Applications/vivaldi-stable".Seen = true;

        Notifications.PopupPosition = "TopRight";

        "Services/powerdevil".ShowPopupsInDndMode = true;
      };

      plasmaparc = {
        General.AudioFeedback = false;
        plasmaparcGeneral.RaiseMaximumVolume = true;
      };

      plasmarc = {
        Theme.name = "default";
        Wallpapers.usersWallpapers = "";
      };

      systemsettingsrc.systemsettings_sidebar_mode.HighlightNonDefaultSettings = false;
    };

    dataFile = {

    };
  };
}
