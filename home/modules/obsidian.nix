{pkgs,...}:
{
  programs.obsidian = {
    enable = true;
    vaults.Brandon1.target = "Brandon1";
  };
  stylix.targets.obsidian.vaultNames = [ "Brandon1" ];
}
