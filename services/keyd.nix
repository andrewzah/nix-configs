{...}: {
  # use `keyd list-keys` to get valid keys
  # invalid keys will silently remap to sth else, lctrl?

  # don't remap system76 devices; use nix's system76-keyboard-configurator
  # program instead, since it supports more complex layering
  # System 76 Launch Lite: ids = ["3384:0001"];
  services.keyd = {
    enable = true;

    # use <sudo keyd monitor> to discover keys/device ids!
    keyboards = {
      default = {
        ids = ["*"];
        settings = {
          main = {
            capslock = "overload(control,esc)";
          };
        };
      };

      hhkb = {
        # HHKB-Hybrid_1 Keyboard
        ids = ["04fe:0021"];
        settings = {
          main = {
            capslock = "layer(control)";
            leftalt = "layer(meta)";
            muhenkan = "layer(alt)";
          };
        };
      };

      internal = {
        # AT Translated Set 2 keyboard
        ids = ["0001:0001"];
        settings = {
          main = {
            capslock = "layer(control)";
            leftmeta = "layer(alt)";
            leftalt = "layer(meta)";
            leftcontrol = "capslock";

            rightalt = "layer(meta)";
            rightcontrol = "hangeul";
            "leftmeta+leftshift+f23" = "layer(alt)"; # copilot key
          };
        };
      };

      jtk_188 = {
        # cheap bluetooth alice-style foldable kb from 쿠팡
        ids = ["04e8:7021"];
        settings = {
          main = {
            capslock = "layer(control)";
            leftmeta = "layer(alt)";
            leftalt = "layer(meta)";
            leftcontrol = "capslock";
          };
        };
      };

      # left side real order: ctrl alt fn super
      system76_launch = {
        settings = {
          main = {
            capslock = "overload(control,esc)";
          };
        };
      };

      ek87 = {
        # Dareu EK87
        ids = ["260d:0060"];
        settings = {
          main = {
            capslock = "layer(control)";
            leftmeta = "layer(alt)";
            leftalt = "layer(meta)";
            leftcontrol = "capslock";
            rightcontrol = "hangeul";
          };
        };
      };

      realforceC1H = {
        # Realforce C1H
        ids = ["0853:031a"];
        settings = {
          main = {
            capslock = "layer(control)";
            leftcontrol = "capslock";
            muhenkan = "layer(meta)";
            henkan = "layer(meta)";
            katakanahiragana = "layer(alt)";
            leftalt = "layer(alt)";
            yen = "backspace";
            ro = "layer(shift)";

            # leftmeta = "layer(alt)";
            # leftalt = "layer(meta)";
            # leftcontrol = "capslock";
            # rightcontrol = "hangeul";
          };
        };
      };
    };
  };
}
