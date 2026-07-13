-- gen by confToLua.py
-- Source: 10-env.conf
-- Some values might need MANUAL check. PLEASE DO BACKUP BEFORE TESTING, PLEASEEEE.


-- Env vars
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("SDL_VIDEO_DRIVER", "wayland")
hl.env("MOZ_ENABLE_WAYLAND", "1")
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_QPA_PLATFORMTHEME", "qt5ct")
hl.env("GTK_THEME", "Arc-Dark")
hl.env("JAVA_FONTS", "/usr/share/fonts/TTF")
hl.env("JDK_JAVA_OPTIONS", "-Dawt.useSystemAAFontSettings=lcd -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel")
