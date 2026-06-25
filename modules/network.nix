{ config, pkgs, lib, ... }:

{
    networking.hostName = "thinkpad"; # Define your hostname.
    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

    # Configure network proxy if necessary
    # networking.proxy.default = "http://user:password@proxy:port/";
    # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

    networking.networkmanager = {
        enable = true;
        wifi.backend = "iwd";

        # tell NM to not manage DNS at all — let resolved handle it entirely
        dns = "systemd-resolved";
    };

    networking.resolvconf.enable = false;

    services.resolved = {
        enable = true;

        settings = {
            Resolve = {
                DNS = [
                    "45.90.28.0#7312f9.dns.nextdns.io"
                    "45.90.30.0#7312f9.dns.nextdns.io"
                    "2a07:a8c0::#7312f9.dns.nextdns.io"
                    "2a07:a8c1::#7312f9.dns.nextdns.io"
                ];

                LLMNR = false;
                DNSSEC = true;
                DNSOverTLS = true;
                MulticastDNS = false;
                Domains = [ "~." ];
            };
        };
    };

    networking.firewall = {
        enable          = true;
        # allowedTCPPorts = [ ... ];
        allowedUDPPorts = [ 51820 ];
        extraInputRules = ''
            ip saddr 192.168.1.0/24 accept
        '';
    };

    environment.systemPackages = with pkgs; [
        openssh
    ];
}
