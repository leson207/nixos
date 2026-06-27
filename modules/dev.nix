{ config, pkgs, lib, ... }:

{
    programs.git = {
        enable = true;

        config = {
            user.name = "leson207";
            user.email = "sonthaile2002@gmail.com";
            init.defaultBranch = "main";
            pull.rebase = true;
        };
    };

    environment.systemPackages = with pkgs; [
        uv
        gcc
        gdb
        gnumake

        tree
        stow

        tree-sitter
    ];
}
