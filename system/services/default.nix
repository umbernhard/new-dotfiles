{ config, lib, pkgs, ... }:

{
  imports = [ ./libvirt.nix ./xserver ./fprint.nix ./bluetooth.nix ./tlp.nix ];
}
