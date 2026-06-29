{ config, pkgs, ... }:

{
    imports = [ 
        # Include the results of the hardware scan.
        ./hardware-configuration.nix
    ];

    nix.settings = {
        trusted-users = [ "root" "victor" ];
        experimental-features = [ "nix-command" "flakes" ];
    };

    services.timesyncd.enable = true;
    time.timeZone = "Asia/Ho_Chi_Minh";

    i18n.defaultLocale = "en_US.UTF-8";
    i18n.extraLocaleSettings.LC_TIME = "vi_VN";

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
