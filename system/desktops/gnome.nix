{ config, lib, pkgs, ... }:

{
  services.xserver = {
    enable = true;

    # Enable the GNOME Desktop Environment.
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    desktopManager.gnome.extraGSettingsOverrides = ''
      [org/gnome/desktop/wm/keybindings]
      maximize=['<Super>k']
      minimize=@as []
      move-to-workspace-1=['<Shift><Super>1']
      move-to-workspace-2=['<Shift><Super>2']
      move-to-workspace-3=['<Shift><Super>3']
      switch-to-workspace-1=['<Super>1']
      switch-to-workspace-2=['<Super>2']
      switch-to-workspace-3=['<Super>3']
      unmaximize=['<Super>j']

      [org/gnome/mutter/keybindings]
      toggle-tiled-left=['<Super>h']
      toggle-tiled-right=['<Super>l']

      [org/gnome/settings-daemon/plugins/color]
      night-light-enabled=true

      [org/gnome/settings-daemon/plugins/media-keys]
      screensaver=['<Shift><Control>Escape']
    '';
  };
}
