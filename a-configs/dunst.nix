{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        font = "Noto Sans 10";
        frame_color = "#89B4FA";
        separator_color = "auto";
        markup = "full";
        format = "<b>%s</b>\\n%b";
        timeout = 2000;
      };

      urgency_low = {
        background = "#1E1E2E";
        foreground = "#CDD6F4";
        timeout = 2;
      };

      urgency_normal = {
        background = "#1E1E2E";
        foreground = "#CDD6F4";
        timeout = 2;
      };

      urgency_critical = {
        background = "#F38BA8";
        foreground = "#1E1E2E";
        frame_color = "#F38BA8";
        timeout = 2000;
      };
    };
  };
}
