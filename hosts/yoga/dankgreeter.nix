{pkgs,...}:
{
    programs.dankMaterialShell.greeter = {
        enable = true;
        compositor.name = "hyprland";
        configHome = "/home/Prometheus";
        logs = {
            save = true;
            path = "/tmp/dms-greeter.log";
        };
    };
}
