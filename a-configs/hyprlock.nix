{ config, pkgs, lib, ... }: {
  programs.hyprlock = {
    enable = true;
    settings = {

      general = {
        disable_loading_bar = false;
        grace = 5;
        hide_cursor = true;        # опечатка: hide_coursor → hide_cursor
      };

      background = [
        {
          monitor = "";
          path = "${config.home.homeDirectory}/nixos/a-configs/misc/dark_water.jpg";  # абсолютный путь
          blur_passes = 3;
          blur_size = 2;
          noise = 0.02;
          contrast = 1.1;
          brightness = 0.8;
          vibrancy = 0.2;
        }
      ];

      # повторяющиеся секции — списки, не дублирующиеся атрибуты
      label = [
        {
          monitor = "";
          text = ''cmd[update:1000] echo "$(date +'%H:%M')"'';
          color = "rgba(255, 255, 255, 0.9)";
          font_size = 80;
          font_family = "JetBrains Mono";
          position = "0, 200";
          halign = "center";
          valign = "center";
        }
        {
          monitor = "";
          text = ''cmd[update:60000] echo "$(date +'%A, %d %B')"'';
          color = "rgba(255, 255, 255, 0.7)";
          font_size = 25;
          font_family = "JetBrains Mono";
          position = "0, 120";
          halign = "center";
          valign = "center";
        }
        {
          monitor = "";
          text = "why are you still alive?";
          color = "rgba(255, 255, 255, 0.7)";
          font_size = 20;
          font_family = "JetBrains Mono";  # опечатка: font_famili → font_family
          position = "0, 40";
          halign = "center";
          valign = "center";
        }
      ];

      "input-field" = [
        {
          monitor = "";
          size = "300, 50";
          outline_thickness = 2;
          dots_size = 0.3;
          dots_spacing = 0.2;
          dots_center = true;
          outer_color = "rgba(255, 255, 255, 0.3)";
          inner_color = "rgba(0, 0, 0, 0.5)";
          font_color = "rgba(255, 255, 255, 1)";
          fade_on_empty = false;
          rounding = 10;
          placeholder_text = "<i></i>";
          position = "0, -50";
          halign = "center";
          valign = "center";
        }
      ];

    };
  };
}
