{ config, pkgs, lib, ... }:

{
    programs.foot = {
        enable = true;

        # niri handle this
        xdg.serverAutostart = false;
    };

    programs.zsh.enable = true;
    programs.atuin.enable = true;
    programs.direnv.enable = true;
    programs.zoxide.enable = true;
    programs.starship.enable = true;

    environment.systemPackages = with pkgs; [
        nushell

        fastfetch

        fd
        fzf
        ripgrep

        jq
        eza
        bat
    ];
}
