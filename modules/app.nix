{ config, pkgs, lib, ... }:

{
    services.tumbler.enable = true;
    programs.yazi.enable = true;
    programs.thunar = {
        enable = true;
        plugins = with pkgs; [ thunar-archive-plugin ];
    };

    environment.systemPackages = with pkgs; [
        firefox
        brave
    ];
}
