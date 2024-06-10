{inputs, ...}: {
  imports = [inputs.catppuccin.homeManagerModules.catppuccin];
  gtk = {
    enable = true;
    catppuccin = {
      enable = true;
      flavor = "mocha";
      accent = "lavender";
      icon.enable = true;
      icon.accent = "lavender";
      size = "standard";
      tweaks = [ "normal" ];
    };
  };
  
  programs.alacritty.catppuccin.enable = true;
  programs.fish.catppuccin.enable = true;
  programs.bat.catppuccin.enable = true;
  programs.helix.catppuccin.enable = true;
  programs.bottom.catppuccin.enable = true;
  qt.style.catppuccin.enable = true;
  qt.style.catppuccin.accent = "lavender";
  wayland.windowManager.hyprland.catppuccin.enable = true;
  wayland.windowManager.hyprland.catppuccin.accent = "lavender";
}
