{ config, lib, pkgs, home-manager, ... }:

{
  users = {
    extraUsers.matt = {
      extraGroups = [ "wheel" "audio" "video" "libvirtd" "networkmanager" "input" ];
      description = "Matt Bernhard";
      useDefaultShell = true;
      isNormalUser = true;
      createHome = true;
    };
    defaultUserShell = pkgs.zsh;
  };

  environment.systemPackages = [ pkgs.git pkgs.home-manager pkgs.fprintd pkgs.chrome-gnome-shell pkgs.sbctl pkgs.efitools pkgs.powertop pkgs.vagrant pkgs.libfprint-2-tod1-goodix ];
}
