{ config, pkgs, lib, ... }:

{
    security.sudo = {
        enable = true;

        extraConfig = ''
        Defaults insults

        Defaults umask = 0022
        Defaults umask_override

        Defaults passwd_timeout=0
        Defaults timestamp_timeout=10

        Defaults timestamp_type=ppid
        Defaults passprompt="^G[sudo] password for %p: "

        Defaults env_keep += "ftp_proxy http_proxy https_proxy no_proxy"
        '';
    };

    users.users."victor" = {
        isNormalUser = true;
        description = "victor";
        extraGroups = [ "wheel" "networkmanager" ];
        packages = with pkgs; [];
        shell = pkgs.zsh;
    };
}
