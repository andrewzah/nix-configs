{ pkgs, stateVersion, ... }:
{
  imports =
    [
      ../common.nix
      ../common-linux.nix
      ./hardware-configuration.nix
    ];

  security.pki.certificateFiles = [
    /home/andrew/work/0proxy/pki/docker-registry.arpa.crt
    #../../static-files/docker-registry.arpa.crt
  ];

  programs.zsh.shellAliases = {
    switch = "sudo nixos-rebuild switch --flake /etc/nixos#xps9300";
  };

  programs.gnupg.agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-curses;
  };

  programs.hyprland.enable = true;
  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
      vaapiIntel
    ];
  };

  services.syncthing = {
    enable = true;
    dataDir = "/home/andrew/sync";
    configDir = "/home/andrew/sync/config";
    user = "andrew";
    group = "users";
    overrideFolders = false;
    overrideDevices = false;
    settings = {
      options = {
        # don't submit anon usage data
        urAccepted = -1;
      };
      devices = {
        "eagle" = { id = "KBKNDRJ-2HCG7A4-OOR7NX6-APK3DUU-KKODEFE-GCFPD5S-SHLRNFJ-OFKIHQX"; };
      };
    };
  };

  systemd.services = {
    keyd = {
      enable = true;

      description = "keyd daemon";
      wantedBy = [ "multi-user.target" ];
      unitConfig = {
        After = "local-fs.target";
      };

      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.keyd}/bin/keyd";
        Restart = "always";
      };
    };
  };
  environment.etc."keyd/default.conf".text = ''
  [ids]
  0001:0001

  [main]
  capslock = overload(control, esc)

  leftmeta = layer(alt)
  leftalt = layer(meta)
  rightalt = layer(meta)
  '';


  virtualisation = {
    docker.enable = true;
    docker.autoPrune.enable = true;

    containerd.enable = true;
  };

  users.users.andrew.extraGroups = [ "docker" ];

  i18n.inputMethod.enabled = "fcitx5";
  i18n.inputMethod.fcitx5.addons = with pkgs; [ fcitx5-hangul ];
  i18n.inputMethod.fcitx5.ignoreUserConfig = true;
  i18n.inputMethod.fcitx5.settings.inputMethod = {
    "Groups/0" = {
      "Name" = "Default";
      "Default Layout" = "us";
      "DefaultIM" = "hangul";
    };

    "Groups/0/Items/0" = {
      "Name" = "keyboard-us";
      "Layout" = "null";
    };

    "Groups/0/Items/1" = {
      "Name" = "hangul";
      "Layout" = "null";
    };

    "GroupOrder" = {
      "0" = "Default";
    };
  };

  i18n.inputMethod.fcitx5.settings.globalOptions = {
    Hotkey = {
      EnumerateWithTriggerKeys = true;
      EnumerateForwardKeys = null;
      EnumerateBackwardKeys = null;
      EnumerateSkipFirst = false;
      EnumerateGroupForwardKeys = null;
      EnumerateGroupBackwardKeys = null;
    };

    "Hotkey/TriggerKeys" = {
      "0" = "Control+Alt+space";
      #2=Hangul
    };
    "Hotkey/AltTriggerKeys" = {
      "0" = "Shift_L";
    };
    "Hotkey/ActivateKeys" = {
      "0" = "Hangul_Hanja";
    };
    "Hotkey/DeactivateKeys" = {
      "0" = "Hangul_Romaja";
    };
    "Hotkey/PrevPage" = {
      "0" = "Up";
    };
    "Hotkey/NextPage" = {
      "0" = "Down";
    };
    "Hotkey/PrevCandidate" = {
      "0" = "Shift+Tab";
    };
    "Hotkey/NextCandidate" = {
      "0" = "Tab";
    };
    "Hotkey/TogglePreedit" = {
      "0" = "Control+Alt+P";
    };

    "Behavior" = {
     ActiveByDefault = false;
     ShareInputState = "No";
     PreeditEnabledByDefault = true;
     ShowInputMethodInformation = true;
     showInputMethodInformationWhenFocusIn = false;
     CompactInputMethodInformation = true;
     ShowFirstInputMethodInformation = true;
     DefaultPageSize = "5";
     OverrideXkbOption = false;
     CustomXkbOption = null;
     EnabledAddons = null;
     DisabledAddons = null;
     PreloadInputMethod = true;
     AllowInputMethodForPassword = false;
     ShowPreeditForPassword = false;
     AutoSavePeriod = "30";
    };
  };

  time.timeZone = "Asia/Seoul";

  networking.hostName = "xps9300";
  system.stateVersion = stateVersion;
}
