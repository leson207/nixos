{ config, pkgs, lib, ... }:

{
    services = {
        tlp = {
            enable = true;
            pd.enable = true;
            settings = {
                CPU_SCALING_GOVERNOR_ON_AC  = "performance";
                CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
                CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
            };
        };

        power-profiles-daemon.enable = false;

        upower = {
            enable                = true;
            percentageLow         = 20;
            percentageCritical    = 10;
            percentageAction      = 5;
            criticalPowerAction   = "Hibernate";   # or "PowerOff" / "HybridSleep"
        };


        thermald.enable = true;

        ananicy.enable = true;

        irqbalance.enable = true;
    };
}
