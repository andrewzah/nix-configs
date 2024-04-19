{ config, pkgs, inputs, ... }:
{
  # https://daiderd.com/nix-darwin/manual/index.html#sec-options
  system = {
    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToControl = true;
    };

    defaults = {
      dock = {
        autohide = true;
        orientation = "bottom";
        mineffect = "genie";
        show-process-indicators = true;
        showhidden = true;
      };
      finder = {
        AppleShowAllExtensions = true;
        FXEnableExtensionChangeWarning = false;
        CreateDesktop = false;
      };
      trackpad = {
        Clicking = true;
        TrackpadThreeFingerDrag = true;
        Dragging = true;
      };

      # apple firewall
      alf = {
        globalstate = 2;
        loggingenabled = 0;
        stealthenabled = 1;
      };

      loginwindow = {
        GuestEnabled = false;
        DisableConsoleAccess = true;
      };

      SoftwareUpdate.AutomaticallyInstallMacOSUpdates = true;
      NSGlobalDomain = {
        AppleInterfaceStyle = "Dark";
        AppleKeyboardUIMode = 3;
        ApplePressAndHoldEnabled = false;
        NSAutomaticCapitalizationEnabled = false;
        NSAutomaticDashSubstitutionEnabled = false;
        NSAutomaticPeriodSubstitutionEnabled = false;
        NSAutomaticQuoteSubstitutionEnabled = false;
        NSAutomaticSpellingCorrectionEnabled = false;
        NSNavPanelExpandedStateForSaveMode = true;
        NSNavPanelExpandedStateForSaveMode2 = true;
        # todo: complete sketchybar config
        _HIHideMenuBar = false;
      };
    };
  };
}
