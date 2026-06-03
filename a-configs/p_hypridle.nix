{ config, lib, pkgs, ... }: {
  services.hypridle = {
    enable = true;
    settings = {

      general = {
        lock_cmd = "pidof hyprlock || hyprlock";
        before_sleep_cmd = "dunstify bye";
        after_sleep_cmd = "dunstify hello";
      };

      listener = [
        {
          timeout = 180;                              # число, не строка
          on-timeout = "niri msg action power-off-monitors";
		}
		{
		  timeout = 300;
		  on-timeout = "hyprlock";
        }
        {
          timeout = 600;
          on-timeout = "systemctl suspend-then-hibernate";
          on-resume = "dunstify welcome back";        # опечатка: wellcome → welcome
        }
      ];

    };
  };
}
