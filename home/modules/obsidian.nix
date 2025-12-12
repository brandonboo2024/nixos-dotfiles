{pkgs,...}:
{
  programs.obsidian = {
    enable = true;
    vaults.Brandon1.target = "Brandon1";
    vaults.Brandon1.settings.corePlugins = {
        sync.enable = true;
    };
  };
  stylix.targets.obsidian.vaultNames = [ "Brandon1" ];
}
