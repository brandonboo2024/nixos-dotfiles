{config,lib,input,pkgs,...}:
{
  programs.firefox = {
    enable = true;
    profiles."gtzi7pmn.default".extensions.force= true;
  };
  stylix.targets.firefox.profileNames = ["gtzi7pmn.default"];
  stylix.targets.firefox.colorTheme.enable = true;
  
}
