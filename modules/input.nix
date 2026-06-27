{ config, pkgs, lib, ... }:

{
    i18n.inputMethod = {
        enable = true;

        type = "fcitx5";

        fcitx5.addons = with pkgs; [
            fcitx5-gtk
            qt6Packages.fcitx5-unikey
            qt6Packages.fcitx5-configtool
        ];
        fcitx5.waylandFrontend = true;
        # https://fcitx-im.org/wiki/Using_Fcitx_5_on_Wayland
    };

    environment.sessionVariables = {
        # GTK_IM_MODULE = "fcitx";
        QT_IM_MODULE = "fcitx";
        QT_IM_MODULES = "wayland;fcitx;ibus";
        XMODIFIERS = "@im=fcitx";
        SDL_IM_MODULE = "fcitx";
        GLFW_IM_MODULE = "ibus";
    };

    # Configure keymap in X11
    services.xserver.xkb = {
        layout = "us";
        variant = "";
    };

    fonts = {
        enableDefaultPackages = true;

        packages = with pkgs; [
            noto-fonts
            noto-fonts-cjk-sans
            noto-fonts-color-emoji

            fira-code
            jetbrains-mono

            nerd-fonts.fira-code
            nerd-fonts.jetbrains-mono
        ];

        # fontconfig.defaultFonts = {
        #     monospace = [
        #         "JetBrainsMono Nerd Font"
        #         "Noto Sans Mono"
        #     ];
        #
        #     sansSerif = [
        #         "Noto Sans"
        #     ];
        #
        #     serif = [
        #         "Noto Serif"
        #     ];
        #
        #     emoji = [
        #         "Noto Color Emoji"
        #     ];
        # };
    };

}
