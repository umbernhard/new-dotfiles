{
  description = "NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ nixpkgs, nixpkgs-unstable, home-manager, ... }: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [./system];
      };
    };
 
    homeConfigurations = {
      "matt" = inputs.home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs-unstable {
          system = "x86_64-linux";
          config.allowUnfree = true;
        };
        modules = [
          ./home
        ];
      };
    };
  };
}
