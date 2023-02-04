{ config, lib, pkgs, ... }:

{
  imports = [ ./kernel/kernel.nix ./grub/grub.nix];

  boot.extraModprobeConfig = ''
	options iwlwifi 11n_disable=1 swcrypto=0 bt_coex_active=0 power_save=0
	options iwlmvm power_scheme=1 
	options iwlwifi d0i3_disable=1 
	options iwlwifi uapsd_disable=1 
	options iwlwifi lar_disable=1
  '';
	
  boot.supportedFilesystems = [ "btrfs" ];
}
