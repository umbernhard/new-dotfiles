{ pkgs, lib, ... }:

{
  home.packages = with pkgs; [ neovim ];
  programs.neovim.extraConfig = lib.fileContents ./init.lua;
}
