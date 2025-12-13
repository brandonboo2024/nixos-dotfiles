{pkgs,...}:
{
    programs.dankMaterialShell.greeter = {
        enable = true;
        compositor.name = "mango";
        configHome = "/home/Daedalus";
        logs = {
            save = true;
            path = "/tmp/dms-greeter.log";
        };
    };
}
