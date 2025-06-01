{ config, pkgs, ... }: {

programs.alacritty = {
  enable = true;
  settings = {
    window = {
      dimensions = { columns = 120; lines = 35; };
      padding = { x = 10; y = 10; };
      opacity = 0.9;
    };

    font = {
      normal = {
        #family = "JetBrainsMono Nerd Font";
        #style = "Regular";
      };
      size = 14;
    };

    colors = {
      primary = {
        background = "0x202020";
        foreground = "0xdcd7ba";
      };
      cursor = {
        text = "0x1e1e2e";
        cursor = "0xdcd7ba";
	#shape = "Block";
	#blinking = "On";
	#unfocused_hollow = true;
      };
    };
  };
};
}
