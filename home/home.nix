{ inputs, config, pkgs, ... }:

{
    imports = [
        inputs.noctalia.homeModules.default
    ];

    home.username = "victor";
    home.homeDirectory = "/home/victor";

    home.stateVersion = "26.11";

    programs.noctalia.enable = true;
    programs.home-manager.enable = true;

    home.packages = with pkgs; [
        mpv
        imv
        xarchiver
        libreoffice-fresh
        zathuraPkgs.zathura_core
        zathuraPkgs.zathura_pdf_mupdf
    ];

    # home.file.".config/nvim".source = ../dotfiles/nvim;
}
