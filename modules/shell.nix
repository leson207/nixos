{ config, pkgs, lib, ... }:

{
    programs.foot = {
        enable = true;

        # niri handle this
        xdg.serverAutostart = false;
    };

    programs.zsh.enable = true;
    programs.direnv.enable = true;
    programs.zoxide.enable = true;
    programs.starship.enable = true;

    environment.systemPackages = with pkgs; [
        nushell
        atuin

        fastfetch

        fd
        fzf
        ripgrep

        jq
        eza
        bat
    ];
}
