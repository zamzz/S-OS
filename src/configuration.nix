{
  modulesPath,
  lib,
  pkgs,
  ...
} @ args:
{
  imports = [
    ./disk-config.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  services.openssh.enable = true;
  services.openssh.settings = {
    PasswordAuthentication = true;
  };
  
  users.users.zamz = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    hashedPassword = "$6$OQhBzFWrlrBrXjrk$9VioBVAyqEcx8VEdfeqyLhhQYaBlSMluVvkXFTZHwe4EhbraYnSdCykng/gD7IQjYfdt3AZzVD4yk9fbBTBoZ1";
  };

  zramSwap = {
    enable = true;
    algorithm = "zstd";      # "zstd" provides great compression; "lz4" is faster with lower CPU usage
    memoryPercent = 100;     # The max virtual size relative to your total RAM (100% is typical)
    priority = 100;          # Tells the kernel to use zram BEFORE using any physical disk swap
  };
  # Optional but highly recommended when using zram:
  # Enables a userspace out-of-memory killer to prevent the system from hard-locking 
  # if zram hits its maximum compression ceiling.
  systemd.oomd.enable = true;

  networking.networkmanager.enable = true;

  system.stateVersion = "26.05";
}