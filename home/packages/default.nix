{ config, pkgs, ... }:
{
  imports = [./cli.nix ./desktop.nix ./development.nix ./nvim ];
}
