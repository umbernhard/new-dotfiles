{ config, pkgs, ... }:

{
  imports = [  ./hardware-configuration.nix ./network.nix ./boot ./nix ./fonts ./services ./user ./desktops ./services ];
  i18n.defaultLocale = "en_US.UTF-8";
  system.stateVersion = "23.05";
  time.timeZone = "America/Detroit";
}
