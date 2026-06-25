{ config, inputs, pkgs, lib, ... }:

{
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

    environment.systemPackages = with pkgs; [
        qt6.qtwayland
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

    environment.sessionVariables = {
        APP2UNIT_SLICES = "a=app-graphical.slice b=background-graphical.slice s=session-graphical.slice";
    };
}
