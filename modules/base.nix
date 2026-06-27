{ config, pkgs, lib, ... }:

{
    boot.loader.systemd-boot.enable = true;
    boot.loader.systemd-boot.configurationLimit = 5;
    boot.loader.efi.canTouchEfiVariables = false;       # false since you share ESP with Arch, true would let NixOS control boot order

    boot.kernelParams = [
        "rw"
        "modprobe.blacklist=radeon,amdgpu"
    ];

    hardware.cpu.intel.updateMicrocode = true;      

    boot.initrd.kernelModules = [ "i915" ];

    hardware.bluetooth.enable = true;

    hardware.graphics = {
        enable = true;

        extraPackages = with pkgs; [
            mesa
            intel-media-driver
        ];
    };

    environment.variables = {
        LIBVA_DRIVER_NAME = "iHD";
    };

    security.rtkit.enable = true;        # allows PipeWire to request realtime priority

    services.pipewire = {
        enable            = true;
        alsa.enable       = true;          # pipewire-alsa
        alsa.support32Bit = true;          # for 32-bit apps (Steam, Wine)
        pulse.enable      = true;          # pipewire-pulse (PulseAudio compat)
        wireplumber.enable = true;         # session manager
    };
}

