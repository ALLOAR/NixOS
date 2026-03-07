{ config, pkgs, ... }: {
programs.mpv = {
    enable = true;
    config = {
      input-ipc-server = "/tmp/mpvsocket";
    };
  };
}
