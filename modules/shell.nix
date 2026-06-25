{ config, pkgs, lib, ... }:

{
    programs.foot = {
        enable = true;

        # niri handle this
        xdg.serverAutostart = false;
    };

    programs.zsh.enable = true;
    programs.zoxide.enable = true;
    programs.starship.enable = true;

    environment.systemPackages = with pkgs; [
        nushell
        atuin

        tree
        fastfetch

        fd
        fzf
        ripgrep

        eza
        bat
        jq
    ];
}
