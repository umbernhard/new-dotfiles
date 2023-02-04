{ config, lib, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;

    oh-my-zsh = { 
      enable = true;
      plugins = [ "git" "python" "man" ];
      theme = "robbyrussell";
    };
  };
}
