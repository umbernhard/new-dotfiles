{ config, lib, pkgs, ... }:

{
  programs.zsh.ohMyZsh = {
    enable = true;
    plugins = [ "git" "python" "man" ];
    theme = "robby-russel";
    customPkgs = [
      pkgs.nix-zsh-completions
    ];
  };
}
