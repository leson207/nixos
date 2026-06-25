nix flake update          # update ALL inputs to latest
nix flake update nixpkgs  # update only nixpkgs
nix flake lock            # just write/refresh lock without updating
# Build + activate (from inside /etc/nixos where flake.nix lives)
sudo nixos-rebuild switch --flake .#thinkpad

# Or specify path explicitly
sudo nixos-rebuild switch --flake /etc/nixos#thinkpad

# Test in a VM first (doesn't touch bootloader)
sudo nixos-rebuild test --flake .#thinkpad

# Build only, don't activate
sudo nixos-rebuild build --flake .#thinkpad

# Inspect what a flake exposes
nix flake show /etc/nixos

# Check inputs and their revs
nix flake metadata /etc/nixos

# Run a one-off package from nixpkgs without installing
nix run nixpkgs#ripgrep

# Open a dev shell with tools
nix develop nixpkgs#clang
