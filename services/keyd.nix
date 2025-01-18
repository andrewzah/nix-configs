{...}: {
  services.keyd = {
    enable = true;

    keyboards = {
      default = {
        ids = ["*"];
        settings = {
          main = {
            capslock = "overload(control,esc)";

            #leftmeta = "layer(alt)";
            #leftalt = "layer(meta)";
            #rightalt = "layer(meta)";
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
