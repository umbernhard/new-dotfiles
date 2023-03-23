{ config, lib, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;

    oh-my-zsh = { 
      enable = true;
      plugins = [ "git" "python" "man" "ssh-agent" "gpg-agent" ];
      theme = "robbyrussell";
    };

    initExtra = ''
      ssh-add ~/.ssh/github-key
    '';
  };
}
