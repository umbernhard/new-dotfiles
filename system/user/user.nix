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

  environment.systemPackages = with pkgs;
  [
    git
    home-manager
    fprintd
    chrome-gnome-shell
    sbctl
    efitools
    powertop
    vagrant
  ];
}
