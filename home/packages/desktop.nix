{ config, lib, pkgs, ... }:
{
  home.packages = with pkgs; [
    firefox
    (google-chrome.override { commandLineArgs = [ "--ozone-platform=wayland" ];})
    libreoffice-fresh
    tor-browser-bundle-bin
    virt-manager
    vlc
    _1password-gui
    signal-desktop
    evince
  ];
}
