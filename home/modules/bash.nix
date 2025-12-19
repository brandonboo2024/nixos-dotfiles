{lib,config,pkgs,input,...}:
{
  programs.bash={
    enable = true;
    shellAliases = {
      btw = "echo what am i doing";
      cat = "bat";
    };
    initExtra = ''
        function y() {
            local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
            yazi "$@" --cwd-file="$tmp"

            IFS= read -r -d "" cwd < "$tmp"

            [ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
            rm -f -- "$tmp"
         }
    '';
  };
	programs.oh-my-posh = {
		enable = true;
		enableBashIntegration = true;
		useTheme = "darkblood";
	};
}
