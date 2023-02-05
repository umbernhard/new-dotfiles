{ config, pkgs, lib, ...}:

{
    fonts = {
      fontconfig.enable = true;
      fontDir.enable = true;
      enableGhostscriptFonts = true;
      fonts = with pkgs; [ 
        noto-fonts-cjk
        noto-fonts-emoji
        noto-fonts
        nerdfonts
      ];
  };
}
