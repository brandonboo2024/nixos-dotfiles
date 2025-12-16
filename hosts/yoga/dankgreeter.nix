{pkgs,...}:
{
    programs.dankMaterialShell.greeter = {
        enable = true;
        compositor.name = "sway";
        configHome = "/home/Prometheus";
        logs = {
            save = true;
            path = "/tmp/dms-greeter.log";
        };
    };
}
