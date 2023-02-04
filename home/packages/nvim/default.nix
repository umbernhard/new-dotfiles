{ pkgs, ... }:

{
  home.packages = [ unstable.neovim ];
  programs.neovim.extraConfig = lib.fileContents ./init.lua;
}
