{ config, lib, pkgs, ... }:

{
  imports = [
    ./system/hardware-configuration.nix
    ./system/laptop.nix
  ];

  # Use systemd-boot
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  
  # Set the time zone
  time.timeZone = "Europe/Moscow";

  # Select internationalisation properties
  i18n.defaultLocale = "ru_RU.UTF-8";
  console = {
    font = "cyr-sun16";
  };
  
  users.users.tim = {
    isNormalUser = true;
    home = "/home/tim";
    extraGroups = [ "networkmanager" ];
  };

  # Use doas instead of sudo
  security = {
    rtkit.enable = true;
    sudo.enable = false;
    doas = {
      enable = true;
      extraRules = [{
        users = [ "tim" ];
        keepEnv = true;
        persist = true;
      }];
    };
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf
    jetbrains-mono
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "steam"
    "steam-original"
    "steam-run"
  ];

  programs = {
    fish.enable = true;
    hyprland.enable = true;
    steam = {
      enable = true;
      gamescopeSession.enable = true;
    };
  };
   
  programs.bash.interactiveShellInit = ''
    if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
    then
      shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
      exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
    fi
  '';

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    GST_PLUGIN_SYSTEM_PATH_1_0 = lib.makeSearchPathOutput "lib" "lib/gstreamer-1.0" (with pkgs.gst_all_1; [
      gst-plugins-good
      gst-plugins-bad
      gst-plugins-ugly
      gst-libav
      gst-vaapi
    ]);
  };

  # List packages installed in system profile. To search, run:
  environment.systemPackages = with pkgs; [
    fzf
    grc
    wget
    fishPlugins.done
    fishPlugins.fzf-fish
    fishPlugins.forgit
    fishPlugins.hydro
    fishPlugins.grc
  ];

  # List services that you want to enable:
  services = {
    dbus.implementation = "broker";
    gvfs.enable = true;
    upower.enable = true;
    printing.enable = true;
    pipewire = {
      enable = true;
      pulse.enable = true;
      wireplumber.enable = true;
    };
    ananicy = {
      enable = true;
      package = pkgs.ananicy-cpp;
      rulesProvider = pkgs.ananicy-rules-cachyos;
    };
  };

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  system.stateVersion = "24.05";
}
