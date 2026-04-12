{ config, pkgs, ... }: {
# --- git --- #
        programs.git = {
        enable = true;
		  settings = {
			user.name = "ALLOAR";
			user.email = "evgenzbiranik@gmail.com";
		  };
        };
}
