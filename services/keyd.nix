{...}: {
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

      # HHKB-Hybrid_1 Keyboard
      hhkb = {
        ids = ["04FE:0021"];
        settings = {
          main = {
            capslock = "layer(control)";
            leftmeta = "layer(alt)";
            muhenkan = "layer(alt)";
          };
        };
      };

      # AT Translated Set 2 keyboard
      internal = {
        ids = ["0001:0001" "0fac:0ade"];
        settings = {
          main = {
            capslock = "layer(control)";
            leftmeta = "layer(alt)";
            leftalt = "layer(meta)";
            leftcontrol = "capslock";
          };
        };
      };

      system76_launch = {
        ids = ["3384:0001"];
        settings = {
          main = {
            capslock = "overload(control,esc)";
            leftalt = "layer(meta)";
          };
        };
      };
    };
  };
}
#KeyRelease event, serial 34, synthetic NO, window 0x6a00001,
#    root 0x415, subw 0x0, time 185604702, (1392,-20), root:(1394,0),
#    state 0x8, keycode 64 (keysym 0xffe9, Alt_L), same_screen YES,
#    XLookupString gives 0 bytes:
#    XFilterEvent returns: False
#
# KeyRelease event, serial 34, synthetic NO, window 0x6a00001,
#     root 0x415, subw 0x0, time 185559282, (1459,-20), root:(1461,0),
#     state 0x0, keycode 102 (keysym 0xff22, Muhenkan), same_screen YES,

