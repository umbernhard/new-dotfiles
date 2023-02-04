{ config, lib, pkgs, ... }:
{
  home.packages = with pkgs; [
    firefox
    libreoffice-fresh
    tor-browser-bundle-bin
    virt-manager
    vlc
    _1password-gui
    fprintd
  ];
}
