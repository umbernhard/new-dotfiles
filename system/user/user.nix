{ config, lib, pkgs, home-manager, ... }:

{
  users = {
    extraUsers.matt = {
      extraGroups = [ "wheel" "audio" "video" "libvirtd" "networkmanager" ];
      description = "Matt Bernhard";
      useDefaultShell = true;
      isNormalUser = true;
      createHome = true;
    };
    defaultUserShell = pkgs.zsh;
  };
  environment.systemPackages = [pkgs.git pkgs.home-manager pkgs.fprint];
}
