{ config, lib, pkgs, ... }:

{
  nix = {
    package = pkgs.nixFlakes ;
    extraOptions = ''experimental-features = nix-command flakes'';
    settings.trusted-substituters = ["http://cache.nixos.org"]; 
    settings.substituters = ["http://cache.nixos.org"];
    gc.automatic = true;
    gc.dates = "weekly";
    gc.options = "--delete-older-than 30d";
  };
}
