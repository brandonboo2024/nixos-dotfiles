{config,pkgs,pkgsStable,inputs,...}:

{
  programs.dankMaterialShell = {
    enable = true;
    systemd = {
      enable = true; # auto startup
      restartIfChanged = true; # dynamic changes
    };

    default.settings = {
      theme = "dark";
      dynamicTheming = true;
      systemSound = true;
      clipboard = true;
      systemMonitoring = true;
      audioWaveLength = true;
      brightnessControl = true;
    };
  };
}
