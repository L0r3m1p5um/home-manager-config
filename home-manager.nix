{inputs, ...}: {
  flake.homeConfigurations.michael = inputs.home-manager.lib.homeManagerConfiguration {
    pkgs = import inputs.nixpkgs {
      system = "x86_64-linux";
      config = {
        allowUnfree = true;
        cudaSupport = true;
      };
    };
    extraSpecialArgs.inputs = inputs;
    modules = [./home/hosts/home-laptop];
  };
}
