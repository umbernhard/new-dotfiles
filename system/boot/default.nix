{ config, lib, pkgs, ... }:

{
  imports = [ ./kernel/kernel.nix ./lanzaboote/lanzaboote.nix ];
  boot.bootspec.enable = true;

  boot.extraModprobeConfig = ''
	options iwlwifi 11n_disable=1 swcrypto=0 bt_coex_active=0 power_save=0
	options iwlmvm power_scheme=1 
	options iwlwifi d0i3_disable=1 
	options iwlwifi uapsd_disable=1 
	options iwlwifi lar_disable=1
  '';
	
  boot.supportedFilesystems = [ "btrfs" ];

  
  # Taken from https://github.com/kjhoerr/dotfiles
  #
  # enable systemd in initrd 
  boot.initrd.systemd.enable = lib.mkDefault true;

  # Quiet boot with plymouth - supports LUKS passphrase entry if needed
  boot.kernelParams = [
    "quiet"
    "rd.systemd.show_status=false"
    "rd.udev.log_level=3"
    "udev.log_priority=3"
    "boot.shell_on_fail"
    "i915.enable_psr=0"
    "module_blacklist=hid_sensor_hub"
  ];
  boot.consoleLogLevel = 0;
  boot.initrd.verbose = false;
  boot.plymouth.enable = true;

  # TPM for unlocking LUKS
  #
  # TPM kernel module must be enabled for initrd. Device driver is viewable via the command:
  # sudo systemd-cryptenroll --tpm2-device=list
  # And added to a device's configuration:
  # boot.initrd.kernelModules = [ "tpm_tis" ];
  #
  # Must be enabled by hand - e.g.
  # sudo systemd-cryptenroll --wipe-slot=tpm2 /dev/nvme0n1p3 --tpm2-device=auto --tpm2-pcrs=0+2+7
  #
  security.tpm2.enable = true;
  security.tpm2.tctiEnvironment.enable = true;
}
