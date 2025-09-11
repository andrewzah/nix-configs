{pkgs, ...}: {
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-hangul
      fcitx5-gtk
    ];
    fcitx5.ignoreUserConfig = true;

    fcitx5.settings.inputMethod = {
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
      "1" = "Hangul";
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
      ActiveByDefault = true;
      ShareInputState = "Yes";
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
}
