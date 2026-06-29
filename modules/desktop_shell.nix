{ config, inputs, pkgs, lib, ... }:

{
    imports = [
        inputs.noctalia-greeter.nixosModules.default
    ];

    programs.noctalia-greeter = {
        enable = true;
        package = inputs.noctalia-greeter.packages.${pkgs.stdenv.hostPlatform.system}.default;
    };

    programs.niri.enable = true;
    programs.xwayland.enable = true;

    # programs.dms-shell = {
    #     enable = true;
    #     systemd = {
    #         enable  = true;
    #         target  = "niri.service";
    #     };
    # };
    #
    # services.displayManager.dms-greeter = {
    #     enable = true;
    #     compositor.name="niri";
    # };

    environment.sessionVariables = {
        GDK_BACKEND="wayland,x11";

        _JAVA_AWT_WM_NONREPARENTING="1";
        ELECTRON_OZONE_PLATFORM_HINT="auto";
    };

    environment.systemPackages = with pkgs; [
        fuzzel
        app2unit

        inputs.noctalia.packages.${stdenv.hostPlatform.system}.default
    ];

    xdg.portal = {
        enable = true;

        extraPortals = with pkgs; [
            xdg-desktop-portal-gtk
        ];
        config.common.default = "gtk";
    };


}
