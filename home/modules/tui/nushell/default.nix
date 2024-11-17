let
  nushell_home = "/home/michael/.config/nushell";
in {
  programs.nushell = {
    enable = true;
    configFile.text = (builtins.readFile ./config/config.nu);
    envFile.text = (builtins.readFile ./config/env.nu);
  };

  home.file = {
    "${nushell_home}/completions" = {
      source = ./config/completions;
      recursive = true;
    };
    "${nushell_home}/scripts" = {
      source = ./config/scripts;
      recursive = true;
    };
  };
}
