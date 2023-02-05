{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    exa
    fd
    file
    fzf
    git
    gnumake
    killall
    neofetch
    ripgrep
    unzip
    wget
    zip
    htop
  ];
}
