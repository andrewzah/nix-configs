```
$ journalctl --user -xeu ghostty-daemon

Jan 10 16:50:56 dende ghostty[4291]: info: ghostty version=1.2.3
Jan 10 16:50:56 dende ghostty[4291]: info: ghostty build optimize=ReleaseFast
Jan 10 16:50:56 dende ghostty[4291]: info: runtime=apprt.Runtime.gtk
Jan 10 16:50:56 dende ghostty[4291]: info: font_backend=font.main.Backend.fontconfig_freetype
Jan 10 16:50:56 dende ghostty[4291]: info: dependency harfbuzz=12.1.0
Jan 10 16:50:56 dende ghostty[4291]: info: dependency fontconfig=21701
Jan 10 16:50:56 dende ghostty[4291]: info: renderer=renderer.generic.Renderer(renderer.OpenGL)
Jan 10 16:50:56 dende ghostty[4291]: info: libxev default backend=io_uring
Jan 10 16:50:56 dende ghostty[4291]: info(os_locale): setlocale from env result=en_US.UTF-8
Jan 10 16:50:56 dende ghostty[4291]: info(gtk): GTK version build=4.20.3 runtime=4.20.3
Jan 10 16:50:56 dende ghostty[4291]: info(gtk): libadwaita version build=1.8.2 runtime=1.8.2
Jan 10 16:50:56 dende ghostty[4291]: info: reading configuration file path=/home/dragon/.config/ghostty/config
Jan 10 16:50:56 dende ghostty[4291]: info(config): config has 'keybind = clear', all keybinds cleared
Jan 10 16:50:56 dende ghostty[4291]: info(config): config has 'keybind = clear', all keybinds cleared
Jan 10 16:50:56 dende ghostty[4291]: info(config): default shell source=env value=/run/current-system/sw/bin/zsh
Jan 10 16:50:56 dende ghostty[4291]: warning(gtk_ghostty_application): setting GDK_DEBUG=
Jan 10 16:50:56 dende ghostty[4291]: warning(gtk_ghostty_application): setting GDK_DISABLE=gles-api,vulkan
Jan 10 16:50:56 dende .ghostty-wrappe[4291]: Failed to open display
Jan 10 16:50:56 dende systemd[4246]: ghostty-daemon.service: Main process exited, code=exited, status=1/FAILURE
```
