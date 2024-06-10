{ pkgs, ... }:

{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
    '';
    plugins = [
      { name = "grc"; src = pkgs.fishPlugins.grc.src; }
    ];
    shellAbbrs = {
      l = "eza";
      t = "eza --tree";
      f = "rga";
      v = "bat";
      p = "btm";
    };
  };
}
