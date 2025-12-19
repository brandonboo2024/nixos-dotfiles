{
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
    };

    systemd-boot.enable = true;
		systemd-boot.consoleMode = "2";
  };
}
