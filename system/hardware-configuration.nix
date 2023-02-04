# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "thunderbolt" "nvme" "usb_storage" "uas" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.kernelParams = [ "module_blacklist=hid_sensor_hub" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/mapper/cryptdev";
      fsType = "btrfs";
      options = [ "subvol=@" "compress=zstd" "noatime" ];
    };

  boot.initrd.luks.devices."cryptdev".device = "/dev/disk/by-uuid/baa611dc-ba2c-40ed-bef8-04729e2ca9a6";

  fileSystems."/home" =
    { device = "/dev/mapper/cryptdev";
      fsType = "btrfs";
      options = [ "subvol=@home" "compress=zstd" "noatime" ];
    };

  fileSystems."/nix" =
    { device = "/dev/mapper/cryptdev";
      fsType = "btrfs";
      options = [ "subvol=@nix" "compress=zstd" "noatime" ];
    };

  fileSystems."/persist" =
    { device = "/dev/mapper/cryptdev";
      fsType = "btrfs";
      options = [ "subvol=@persist" "compress=zstd" "noatime" ];
    };

  fileSystems."/var/log" =
    { device = "/dev/mapper/cryptdev";
      fsType = "btrfs";
      options = [ "subvol=@log" "compress=zstd" "noatime" ];
      neededForBoot = true;
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/F332-5E15";
      fsType = "vfat";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/6d8ee20d-3e1e-4a88-a93c-85d37cb3bfdd"; }
    ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp166s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
