{ inputs, ... }:

{
  imports = [inputs.ironbar.homeManagerModules.default];

  programs.ironbar = {
    enable = true;

    config = {
      position = "bottom";
      anchor_to_edges = true;
      icon_theme = "Papirus-Dark";
      start = [
        {
          type = "custom";
          class = "power-menu";
          bar = [
            {
              type = "button";
              name = "power-button";
              label = "<span font-size='20pt'>󰐥</span>";
              on_click = "popup:toggle";
            }
          ];
          popup = [
            {
              type = "box";
              orientation = "vertical";
              widgets = [
                {
                  type = "box";
                  widgets = [
                    {
                      type = "button";
                      class = "power-button";
                      label = "<span font-size='20pt'>󰐥</span>";
                      on_click = "!shutdown now";
                    }
                    {
                      type = "button";
                      class = "power-button";
                      label = "<span font-size='20pt'>󰜉</span>";
                      on_click = "!reboot";
                    }
                    {
                      type = "button";
                      class = "power-button";
                      label = "<span font-size='20pt'>󰤄</span>";
                      on_click = "!systemctl suspend";
                    }
                  ];
                }
              ];
            }
          ];
        }
        
        {
          type = "workspaces";
          name_map = {
            "1" = "";
            "2" = "";
            "3" = "";
            "4" = "";
            "5" = "";
            "6" = "";
            "7" = "";
            "8" = "";
            "9" = "";
            "10" = "";
          };
        }
      ];
      center = [
        {
          type = "launcher";
          favorites = [
            "org.gnome.Nautilus"
            "chromium-browser"
            "Alacritty"
            "steam"
            "net.lutris.Lutris"
            "org.prismlauncher.PrismLauncher"
            "org.telegram.desktop"
          ];
        }
      ];
      end = [
        {
          type = "volume";
          format = "{icon} {percentage}%";
          max_volume = 100;
          icons = {
            volume_high = " ";
            volume_medium = "";
            volume_low = "";
            muted = " ";
          };
        }
        {
          type = "upower";
          format = "{percentage}%";
          disable_popup = true;
        }
        {
          type = "clock";
          format = "%d.%m.%Y %H:%M";
        }
        {
          type = "notifications";
          show_count = true;
          icons = {
            closed_none = "󰂜";
            closed_some = "󰂜";
            closed_dnd = "󰪓";
            open_none = "󰂚";
            open_some = "󰂚";
            open_dnd = "󰂠";
          };
        }
        {
          type = "tray";
          icon_size = 20;
        }
      ];
    };
    style = ''
      @define-color rosewater #f5e0dc;
      @define-color flamingo #f2cdcd;
      @define-color pink #f5c2e7;
      @define-color mauve #cba6f7;
      @define-color red #f38ba8;
      @define-color maroon #eba0ac;
      @define-color peach #fab387;
      @define-color yellow #f9e2af;
      @define-color green #a6e3a1;
      @define-color teal #94e2d5;
      @define-color sky #89dceb;
      @define-color sapphire #74c7ec;
      @define-color blue #89b4fa;
      @define-color lavender #b4befe;
      @define-color text #cdd6f4;
      @define-color subtext1 #bac2de;
      @define-color subtext0 #a6adc8;
      @define-color overlay2 #9399b2;
      @define-color overlay1 #7f849c;
      @define-color overlay0 #6c7086;
      @define-color surface2 #585b70;
      @define-color surface1 #45475a;
      @define-color surface0 #313244;
      @define-color base #1e1e2e;
      @define-color mantle #181825;
      @define-color crust #11111b;

      * {
        font-family: JetBrainsMono Nerd Font;
        font-size: 16px;
        border: none;
        border-radius: 18px;
      }

      .popup {
        border: 2px solid @lavender;
        color: @text;
        padding: 0.25em;
      }

      /* START configuration */

      .power-menu #power-button {
        color: @maroon;
        border-radius: 100%;
        margin: 0.25em 0.25em 0.25em 0;
        padding: 0 0.8em 0 0.8em;
      }

      .popup-power-menu .power-button {
        border-radius: 100%;
        color: @text;
        padding: 0 0.6em;
        margin: 0 0.125em;
      }

      .workspaces .item {
        padding: 0 0.45em 0 0.3em;
        margin: 0.25em 0;
        border-radius: 0;
        color: @overlay0;
      }

      .workspaces .item:first-child {
        border-top-left-radius: 20px;
        border-bottom-left-radius: 20px;
      }

      .workspaces .item:last-child {
        border-top-right-radius: 20px;
        border-bottom-right-radius: 20px;
      }

      .workspaces .item.focused {
        color: @lavender;
      }

      /* CENTER configuration */
      
      .launcher .item {
        margin-right: 0.25em;
        border-radius: 0;
        background-color: @base0;
      }

      .launcher .open {
        border-bottom: 2px solid @overlay0;
      }

      .launcher .focused {
        border-bottom: 2px solid @lavender;
      }

      .popup-launcher .popup-item:not(:first-child) {
        border-top: 2px solid @crust;
      }

      /* END configuration */
      
      .volume {
        color: @green;
        border-radius: 20px 4px 4px 20px;
        padding: 0.5em 0.5em 0.5em 0.75em;
        margin: 0.25em 0;
      }

      .upower {
        color: @maroon;
        border-radius: 4px;
        padding: 0 0.5em 0 0;
        margin: 0.25em;
      }

      .clock {
        color: @blue;
        border-radius: 4px 0 0 4px;
        padding: 0 0 0 0.5em;
        margin: 0.25em 0;
      }

      .popup-clock .calendar {
        color: @text;
      }

      .popup-clock .calendar-clock {
        font-size: 2.5em;
      }

      .popup-clock .calendar:selected {
        background-color: @rosewater;
        color: @crust;
      }

      .notifications button {
        color: @sapphire;
        border-radius: 0;
        padding: 0;
        margin: 0.25em 0;
      }

      .notifications .count {
        font-size: 0.8em;
        background-color: @sapphire;
        color: @crust;
        border-radius: 100%;
        margin-right: 0.5em;
        margin-top: 1.2em;
        padding-left: 0.4em;
        padding-right: 0.4em;
      }

      .tray {
        background-color: @surface0;
        border-radius: 0 20px 20px 0;
        padding: 0;
        margin: 0.25em 0;
      }

      .tray .item {
        padding: 0.125em;
      }

      .tray .item:last-child {
        padding-right: 0.75em;
      }
    '';
  };
}
