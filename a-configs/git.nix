{ config, pkgs, ... }: {
# --- git --- #
        programs.git = {
        enable = true;
        userName = "ALLOAR";
        userEmail = "evgenzbiranik@gmail.com";
        };
}
