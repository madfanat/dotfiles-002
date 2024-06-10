{ ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      monitor = ", preferred, auto, 1";
      exec-once = [
        "swaybg -i /etc/nixos/home/hyprland/wallpaper.png -m fill"
      ];

      env = [
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "QT_AUTO_SCREEN_SCALE_FACTOR,1"
        "QT_QPA_PLATFORM,wayland;xcb"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
        "QT_QPA_PLATFORMTHEME,qt5ct"
      ];

      input = {
        kb_layout = "us,ru";
        kb_options = "grp:alt_shift_toggle";
        numlock_by_default = true;
        repeat_delay = 500;
        natural_scroll = true;
        follow_mouse = 2;
      };

      general = {
        border_size = 2;
        gaps_in = 3;
        gaps_out = 3;
        "col.inactive_border" = "$overlay0";
        "col.active_border" = "$accent";
        "col.nogroup_border" = "$overlay0";
        "col.nogroup_border_active" = "$accent";
        layout = "dwindle";
        no_focus_fallback = true;
        resize_on_border = true;
        allow_tearing = false;
      };

      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        force_default_wallpaper = 0;
        disable_autoreload = true;
      };

      decoration = {
        rounding = 18;
        drop_shadow = false;
        blur = {
          enabled = false;
        };
      };
    
      "$mod" = "SUPER";
      "$terminal" = "alacritty";
      "$browser" = "chromium";
      "$fileManager" = "nautilus";
      "$menu" = ''bemenu-run -b -H 50 -p "" --fn "JetBrainsMono 16" --fb "##1e1e2e" --ff "##cdd6f4" --nb "##1e1e2e" --nf "##cdd6f4" --tb "##1e1e2e" --hb "##1e1e2e" --tf "##f38ba8" --hf "##f9e2af" --af "##cdd6f4" --ab "##1e1e2e"'';
  
      bind = [
        # Applications
        "$mod, W, exec, $browser"
        "$mod, A, exec, $terminal"
        "$mod, E, exec, $fileManager"
        "$mod, D, exec, $menu"

        # Actions
        ", PRINT, exec, hyprshot -m region"
        "$mod, PRINT, exec, hyprshot -m output"
        "$mod, Q, killactive,"
        "$mod, L, exit,"
        "$mod, V, togglefloating,"
        "$mod, P, pseudo,"
        "$mod, J, togglesplit,"

        # Focus movement
        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"
        "ALT, Tab, cyclenext"
        "ALT, Tab, bringactivetotop"
        "$mod, F, fullscreen, 1"

        # Window movement
        "$mod SHIFT, left, movewindow, l"
        "$mod SHIFT, right, movewindow, r"
        "$mod SHIFT, up, movewindow, u"
        "$mod SHIFT, down, movewindow, d"

        # Workspaces switching
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 10"

        # Window movement across workspaces
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
        "$mod SHIFT, 0, movetoworkspace, 10"

        # Scrolling through workspaces
        "$mod, mouse_down, workspace, e+1"
        "$mod, mouse_up, workspace, e-1"
      ];

      binde = [
        ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ];

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];
    };
  };
}
