{ config, pkgs, ... }:

{
    imports = [ 
        # Include the results of the hardware scan.
        ./hardware-configuration.nix
    ];

    services.timesyncd.enable = true;
    time.timeZone = "Asia/Ho_Chi_Minh";

    i18n.defaultLocale = "en_US.UTF-8";
    i18n.extraLocaleSettings.LC_TIME = "vi_VN";

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

    services.fstrim = {
        enable = true;
        interval = "weekly";
    };

    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    # List packages installed in system profile. To search, run:
    # $ nix search wget
    environment.systemPackages = with pkgs; [
        neovim
	    firefox
        #  wget
    ];

    # Some programs need SUID wrappers, can be configured further or are
    # started in user sessions.
    # programs.mtr.enable = true;
    # programs.gnupg.agent = {
    #   enable = true;
    #   enableSSHSupport = true;
    # };

    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # on your system were taken. It‘s perfectly fine and recommended to leave
    # this value at the release version of the first install of this system.
    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "26.05"; # Did you read the comment?
}
