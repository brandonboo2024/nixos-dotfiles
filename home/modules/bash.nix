{lib,config,pkgs,input,...}:
{
  programs.bash={
    enable = true;
    shellAliases = {
      btw = "echo what am i doing";
      cat = "bat";
    };
    initExtra = ''
        fastfetch

        function y() {
            local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
            yazi "$@" --cwd-file="$tmp"

            IFS= read -r -d "" cwd < "$tmp"

            [ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
            rm -f -- "$tmp"
         }
    '';
  };
}
