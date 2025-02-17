{ config, pkgs, ... }:

let
  wofiConfig = pkgs.writeText "wofi-config" ''
    # Внешний вид
    appearance:
      background: "#2e3440"
      border_width: 2
      border_color: "#4c566a"
      font: "sans-serif 10"
      selected_bg: "#88c0d0"
      selected_fg: "#2e3440"

    # Разметка и поведение
    layout:
      columns: 4
      rows: 5
    behavior:
      case_sensitive: false
      fuzzy_matching: true
      show_icons: true
  '';
in {
  programs.wofi = {
    enable = true;
    configFile = wofiConfig;
  };
}

