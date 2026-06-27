{ inputs, config, pkgs, ... }:

{
    imports = [
        inputs.noctalia.homeModules.default
    ];

    home.username = "victor";
    home.homeDirectory = "/home/victor";
    programs.noctalia.systemd.enable = true;

    home.stateVersion = "26.11";

    programs.home-manager.enable = true;

    programs.noctalia.enable = true;
    
    home.packages = with pkgs; [
        mpv
        imv
        xarchiver
        libreoffice-fresh
        zathuraPkgs.zathura_core
        zathuraPkgs.zathura_pdf_mupdf

        # megasync
        # telegram-desktop
        # gpu-screen-recorder
        # gpu-screen-recorder-gtk
    ];

    # home.file.".config/nvim".source = ../dotfiles/nvim;
}
