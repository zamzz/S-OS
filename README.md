# S-OS

Sam's - OS... This will be where my nix experiments go.

## Install

I've set this up according to the nixos-anywhere [docs](https://github.com/nix-community/nixos-anywhere).

Installing should be something similar to:

```
nix run github:nix-community/nixos-anywhere -- --generate-hardware-config nixos-facter ./facter.json --flake .#generic-nixos-facter --target-host nixos@<target-ip>
```