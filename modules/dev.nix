{ config, pkgs, lib, ... }:

{
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

    services.gvfs.enable=true;
    environment.systemPackages = with pkgs; [
        uv
        git
        gcc
        gdb
        gnumake

        stow

        tree-sitter
    ];
}
