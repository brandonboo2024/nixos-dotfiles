{lib,config,pkgs,input,...}:
{
    services.spotifyd = {
        enable = true;
        settings = 
        {
            global = {
            };
        };
    };
}
