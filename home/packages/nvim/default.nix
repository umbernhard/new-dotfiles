{ pkgs, lib, ... }:

{
  home.packages = with pkgs; [ neovim ];
  programs.neovim.extraLuaConfig = lib.fileContents ./init.lua;
}
