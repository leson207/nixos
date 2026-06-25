{ inputs, ... }:
{
    nix.settings = {
        trusted-users = [ "root" "victor" ];
        experimental-features = [ "nix-command" "flakes" ];
        substituters = [
            "https://cache.nixos.org"
            "https://nix-community.cachix.org"
            "https://devenv.cachix.org"
            "https://mirror.sjtu.edu.cn/nix-channels/store"
            "https://noctalia.cachix.org"
        ];
        trusted-public-keys = [
            "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
            "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
            "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw="
            "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
        ];
    };

    nixpkgs.overlays = [ inputs.nur.overlays.default ];
}
