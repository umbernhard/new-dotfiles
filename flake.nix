{
  description = "NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    lanzaboote.url = "github:nix-community/lanzaboote";
    neovimMX.url = "github:Gako358/neovim";
  };

  outputs = inputs@{ nixpkgs, home-manager, lanzaboote, neovimMX, ... }: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./system
          lanzaboote.nixosModules.lanzaboote
        ];
      };
    };
 
    homeConfigurations = {
      "matt" = inputs.home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          system = "x86_64-linux";
          config.allowUnfree = true;
          overlays = [ (self: super: {neovim = neovimMX.packages.x86_64-linux.neovimMX;}) ];
        };
        modules = [
          ./home
        ];
      };
    };
  };
}
