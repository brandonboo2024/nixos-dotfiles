{config, lib, pkgs, ...}:
{
  services.swayidle = {
    enable = true;
    timeouts = [
      {
        timeout = 600;
        command = "${pkgs.libnotify}/bin/notify-send 'Idle Warning: Locking in 10 seconds.' -t 10000";
      }
      {
	timeout = 610;
	command = "dms ipc call lock lock";
      }
    ];
  };
}
