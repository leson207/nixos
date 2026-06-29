{ config, pkgs, lib, ... }:

{
    services.gvfs.enable=true;
    services.tumbler.enable = true;
    programs.yazi.enable = true;
    programs.thunar = {
        enable = true;
        plugins = with pkgs; [ thunar-archive-plugin ];
    };

    environment.systemPackages = with pkgs; [
        brave
        firefox
        xdg-user-dirs

        nwg-look
        orchis-theme
        bibata-cursors
        papirus-icon-theme

        qt6Packages.qt6ct
        qt6Packages.qtstyleplugin-kvantum

        # handlr-regex
    ];

    environment.variables = {
        XCURSOR_SIZE="24";
        XCURSOR_THEME="Bibata-Modern-Amber";

        QT_QPA_PLATFORM="wayland;xcb";
        QT_QPA_PLATFORMTHEME = "qt6ct";
        QT_QPA_PLATFORMTHEME_QT6="qt6ct";
        QT_WAYLAND_DISABLE_WINDOWDECORATION="1";
    };
}
