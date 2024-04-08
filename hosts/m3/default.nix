{ config, pkgs, inputs, ... }:

{
  imports = [
    ./pkgs.nix
  ]

  environment.systemPackages = with pkgs; [
    git
    fzf
    clang
    watch
    libiconv
  ];

  users.users.andrew = {
    home = "/Users/andrew";
    name = "andrew";
    shell = pkgs.zsh;
  };

  services.nix-daemon.enable = true;
  nix.package = pks.nix;
  programs.zsh.enable = true;
  system.configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null;

  system.keyboard = {
    enableKeyMapping = true;
    remapCapsLockToControl = true;
  };
  system.defaults = {
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
      _HIHideMenuBar = true;
    };
  };

  security.pam.enableSudoTouchIdAuth = true;
}
