{pkgs,...}:
{
    programs.dankMaterialShell.greeter = {
        enable = true;
        compositor.name = "sway";
        logs = {
            save = true;
            path = "/tmp/dms-greeter.log";
        };
    };
}
