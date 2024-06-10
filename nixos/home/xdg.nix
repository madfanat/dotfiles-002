{ config, ... }:

{
  xdg = {
    enable = true;
    configHome = "${config.home.homeDirectory}/.config";
    cacheHome = "${config.home.homeDirectory}/.cache";
    dataHome = "${config.home.homeDirectory}/.local/share";
    stateHome = "${config.home.homeDirectory}/.local/state";
    userDirs = {
      enable = true;
      createDirectories = true;
      desktop = null;
      publicShare = null;
      templates = null;
      download = "${config.home.homeDirectory}/Загрузки";
      documents = "${config.home.homeDirectory}/Документы";
      pictures = "${config.home.homeDirectory}/Изображения";
      videos = "${config.home.homeDirectory}/Видео";
      music = "${config.home.homeDirectory}/Музыка";
    };
    mimeApps = {
      enable = true;
    };
  };
}
