{ config, lib, pkgs, ... }:

{
  imports = [ ./libvirt.nix ./xserver ];
}
