{ config, pkgs, ... }:
{
  imports = [./packages ./configs];
  home.stateVersion = "22.11";
  home.username = "matt";
  home.homeDirectory = "/home/matt";
  programs.home-manager.enable = true;
  nixpkgs.config.allowUnfree = true;
}
