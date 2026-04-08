{ config, pkgs, ... }:
{
  gtk = {
    enable = true;

    theme = {
      name = "Orchis-Dark";
      # package = pkgs.orchis-theme; # если нужна установка темы, добавь это
    };

    iconTheme = {
      name = "Adwaita";
    };

    font = {
      name = "Cantarell";
      size = 11;
    };

    cursorTheme = {
      name = "Bibata-Modern-Ice";
      size = 24;
      # package = pkgs.bibata-cursors; # добавить при необходимости
    };

    gtk3.extraConfig = {
      "gtk-toolbar-style" = 3;
      "gtk-toolbar-icon-size" = "GTK_ICON_SIZE_SMALL_TOOLBAR";
      "gtk-button-images" = false;
      "gtk-menu-images" = false;
      "gtk-enable-event-sounds" = true;
      "gtk-enable-input-feedback-sounds" = false;
      "gtk-xft-antialias" = 1;
      "gtk-xft-hinting" = 1;
      "gtk-xft-hintstyle" = "hintslight";
      "gtk-xft-rgba" = "rgb";
      "gtk-application-prefer-dark-theme" = true;
      "gtk-decoration-layout" = "icon:minimize,maximize,close";
      "gtk-enable-animations" = true;
      "gtk-modules" = "colorreload-gtk-module";
      "gtk-primary-button-warps-slider" = true;
      "gtk-sound-theme-name" = "ocean";
      "gtk-xft-dpi" = 122880;
    };
  };
}
