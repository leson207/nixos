{ config, lib, pkgs, modulesPath, ... }:

{
    imports =[ 
        (modulesPath + "/installer/scan/not-detected.nix")
    ];

    boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" "rtsx_usb_sdmmc" ];
    boot.initrd.kernelModules = [ ];
    boot.kernelModules = [ "kvm-intel" ];
    boot.extraModulePackages = [ ];

    fileSystems."/" = { 
        device = "/dev/disk/by-uuid/e18689fb-c946-4c5c-b55a-f835ce499513";
        fsType = "ext4";
        options = [ "noatime" ];
    };

    fileSystems."/boot" = { 
        device = "/dev/disk/by-uuid/FCE7-3C97";
        fsType = "vfat";
        options = [ "fmask=0077" "dmask=0077" "utf8" "errors=remount-ro" ];
    };

    swapDevices = [
        { device = "/dev/disk/by-uuid/8df80c9e-2494-4c52-b8eb-b5caf6071684"; }

    ];

    fileSystems."/media/arch" = {
        device = "/dev/disk/by-uuid/e45f170a-8a82-44f5-a4ab-6d9a6fe8ef91";
        fsType = "ext4";
        options = [ "nofail" "noatime" "x-systemd.automount" "x-systemd.idle-timeout=60" ];
    };

    fileSystems."/media/windows_c" = {
        device = "/dev/disk/by-uuid/D49298DD9298C600";
        fsType = "ntfs3";
        options = [
            "uid=1000"
            "gid=1000"
            "dmask=022"
            "fmask=133"
            "windows_names"
            "nofail"
            "x-systemd.automount"
            "x-systemd.idle-timeout=60"
        ];
    };

    fileSystems."/media/windows_d" = {
        device = "/dev/disk/by-uuid/308206F78206C0F8";
        fsType = "ntfs3";
        options = [
            "uid=1000"
            "gid=1000"
            "dmask=022"
            "fmask=133"
            "windows_names"
            "nofail"
            "x-systemd.automount"
            "x-systemd.idle-timeout=60"
        ];
    };

    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
    hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
