{pkgs,...}:
{
  programs.obsidian = {
    enable = true;
    vaults.Brandon1 = {
        target = "Brandon1";
        settings.corePlugins = ["sync"];
    };
  };
  stylix.targets.obsidian.vaultNames = [ "Brandon1" ];
}
