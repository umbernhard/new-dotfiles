{ config, pkgs, ... }:
{
  imports = [./packages ./configs];
  home.stateVersion = "23.05";
  home.username = "matt";
  home.homeDirectory = "/home/matt";
  programs.home-manager.enable = true;
  nixpkgs.config.allowUnfree = true;
}
