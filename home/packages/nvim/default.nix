{ pkgs, ... }:

{
  home.packages = [ nixpkgs-unstable.neovim ];
  programs.neovim.extraConfig = lib.fileContents ./init.lua;
}
