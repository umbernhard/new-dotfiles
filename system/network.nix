{ config, lib, pkgs, ... }:

{
  networking = {
    hostName = "theseus";
    networkmanager.enable = true;
  };
}
