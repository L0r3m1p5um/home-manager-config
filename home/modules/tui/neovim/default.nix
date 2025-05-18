{inputs, ...}: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./plugins
    ./completion.nix
    ./keymappings.nix
    ./options.nix
    ./autocommands.nix
  ];

  home.shellAliases.v = "nvim";

  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    viAlias = true;
    vimAlias = true;

    luaLoader.enable = false;

    filetype.extension.ncl = "nickel";
  };
}
