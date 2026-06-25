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
    };

    fileSystems."/boot" = { 
        device = "/dev/disk/by-uuid/FCE7-3C97";
        fsType = "vfat";
        options = [ "fmask=0077" "dmask=0077" ];
    };

    swapDevices = [
        { device = "/dev/disk/by-uuid/8df80c9e-2494-4c52-b8eb-b5caf6071684"; }

    ];
    
    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
    hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
