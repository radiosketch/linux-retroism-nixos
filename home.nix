{ config, pkgs, ... }:

{
  home.username = "user";
  home.homeDirectory = "/home/user";
  home.stateVersion = "26.05";

  programs.home-manager.enable = true;

  # ============================================================
  # Kitty terminal config
  # ============================================================
  programs.kitty = {
    enable = true;
    settings = {
      shell_integration = "no-cursor";
      cursor_shape = "block";
      window_padding_width = 7;
      window_padding_height = 10;
      scrollback_lines = 3000;
      font_size = "11";
      background_opacity = "0.8";
      cursor               = "#207874";
      selection_background = "#d8d8d8";
      selection_foreground = "#207874";
      background           = "#101010";
      foreground           = "#d8d8d8";
      color0  = "#9400ff"; color8  = "#92fcfa";
      color1  = "#ff0000"; color9  = "#ff0000";
      color2  = "#00ff5d"; color10 = "#00ff5d";
      color3  = "#AC82E9"; color11 = "#AC82E9";
      color4  = "#7b91fc"; color12 = "#7b91fc";
      color5  = "#fce40f"; color13 = "#fce40f";
      color6  = "#8F56E1"; color14 = "#8F56E1";
      color7  = "#ff00ee"; color15 = "#d3d3d3";
    };
    keybindings = {
      "ctrl+shift+plus"  = "change_font_size all +1.0";
      "ctrl+shift+minus" = "change_font_size all -1.0";
    };
  };

  # ============================================================
  # Hyprland config
  # ============================================================
  xdg.configFile."hypr/hyprland.conf".force = true;
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    configType = "hyprlang";
    settings = {
      monitor = ", preferred, auto, 1";

      exec-once = [
        "systemctl --user start hyprpolkitagent"
        "nm-applet"
        "hyprpaper"
        "quickshell"
        "hyprctl setcursor Hackneyed-24px 24"
      ];

      env = [
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_SIZE,24"
      ];

      "$terminal"    = "kitty";
      "$fileManager" = "nemo";
      "$mainMod"     = "SUPER";
      "$menu"        = "quickshell ipc call appLauncher_$(hyprctl monitors -j | jq -r '.[] | select(.focused == true) | .name') toggleAppLauncher";

      input = {
        kb_layout = "us,se";
        kb_options = "grp:alt_shift_toggle";
        follow_mouse = 1;
        sensitivity = 0;
        touchpad = {
          natural_scroll = false;
        };
      };

      cursor = {
        no_hardware_cursors = true;
      };

      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 1;
        "col.active_border"   = "rgb(d8d8d8)";
        "col.inactive_border" = "rgb(9b9b9b)";
        resize_on_border = true;
        layout = "dwindle";
        allow_tearing = false;
      };

      decoration = {
        rounding = 0;
        active_opacity = 1.0;
        inactive_opacity = 1.0;
        shadow = {
          enabled = true;
          range = 2;
          render_power = 5;
          sharp = false;
          color = "rgba(0,0,0,0.85)";
          offset = "2 2";
          scale = 1;
        };
        blur = {
          enabled = false;
        };
      };

      animations = {
        enabled = false;
      };

      dwindle = {
        preserve_split = true;
      };

      misc = {
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
      };

      bind = [
        "$mainMod, Return, exec, $terminal"
        "$mainMod, Q, killactive,"
        "$mainMod SHIFT, S, exec, hyprshot --mode region --output-folder /tmp"
        "$mainMod, E, exec, $fileManager"
        "$mainMod SHIFT, SPACE, togglefloating"
        "$mainMod, F, fullscreen"
        "$mainMod, D, exec, $menu"
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"
        "$mainMod, Tab, cyclenext"
        "$mainMod, Tab, bringactivetotop"
        "$mainMod, PRINT, exec, grim -g \"$(slurp)\" ~/Pictures/Screenshots/$(date +'%Y-%m-%d_%H-%M-%S').png && notify-send \"Screenshot Captured\" \"Saved to ~/Pictures/Screenshots/\" -i accessories-screenshot"
        "$mainMod SHIFT, PRINT, exec, grim ~/Pictures/Screenshots/$(date +'%Y-%m-%d_%H-%M-%S').png && notify-send \"Screenshot Captured\" \"Saved to ~/Pictures/Screenshots/\" -i accessories-screenshot"
      ];

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      bindel = [
        ",XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ",XF86MonBrightnessUp, exec, brightnessctl s 10%+"
        ",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
      ];
    };
  };

  # ============================================================
  # Hyprpaper
  # ============================================================
  services.hyprpaper = {
    enable = true;
    settings = {
      splash = false;
      wallpaper = [
        {
          monitor = "LVDS-1";
          path = "/etc/nixos/wallpapers/copyleft.png";
        }
      ];
    };
  };

  # ============================================================
  # Quickshell config
  # ============================================================
  home.file.".config/quickshell" = {
    source = ./quickshell;
    recursive = true;
  };

  # ============================================================
  # GTK theme
  # ============================================================
  gtk = {
    enable = true;
    theme = {
      name = "ClassicPlatinumStreamlined";
      package = pkgs.stdenv.mkDerivation {
        name = "ClassicPlatinumStreamlined";
        src = ./gtk_theme/ClassicPlatinumStreamlined;
        installPhase = ''
          mkdir -p $out/share/themes/ClassicPlatinumStreamlined
          cp -r . $out/share/themes/ClassicPlatinumStreamlined
        '';
      };
    };
    iconTheme = {
      name = "RetroismIcons";
      package = pkgs.stdenv.mkDerivation {
        name = "RetroismIcons";
        src = ./icon_theme/RetroismIcons;
        dontFixup = true;
        installPhase = ''
          mkdir -p $out/share/icons/RetroismIcons
          cp -r . $out/share/icons/RetroismIcons
        '';
      };
    };
  };

  # ============================================================
  # Mako notification daemon
  # ============================================================
  services.mako.enable = true;
}
