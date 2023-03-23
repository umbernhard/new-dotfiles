{ config, lib, pkgs, ... }:

{
  imports = [ ./pipewire.nix ];
#  services = {
#    xserver = {
#      videoDrivers = [ "intel" ];
#      enable = true;
#      layout = "us";
#    };
#  };
  hardware = {opengl.driSupport32Bit = true;};
}
