{inputs, config, pkgs, ...}:

{
  imports = [
    ./home/xdg.nix
    ./home/fish.nix
    ./home/eza.nix
    ./home/bottom.nix
    ./home/bat.nix
    ./home/alacritty.nix
    ./home/helix.nix
    ./home/git.nix
    ./home/zoxide.nix
    ./home/hyprland/hyprland.nix
    ./home/hyprland/hypridle.nix
    ./home/swaync.nix
    ./home/ironbar.nix
    ./home/bemenu.nix
    ./home/chromium.nix
    ./home/obs.nix
    ./home/catppuccin.nix
  ];

  home = {
    username = "tim";
    homeDirectory = "/home/tim";
  };

  home.packages = with pkgs; [
    ripgrep-all
    wl-clipboard
    hyprshot
    swaybg
    gnome.nautilus
    gnome.eog
    clapper
    deadbeef
    transmission_4-gtk
    telegram-desktop
    yt-dlp
    prismlauncher
    lutris
    # proton-ge-bin
  ];

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 24;
  };

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;
}
