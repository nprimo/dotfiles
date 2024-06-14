{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-24.05";
  };

  outputs = { self, nixpkgs, ... }:
	let
		lib = nixpkgs.lib;
	in {
		nixosConfigurations = {
			nixos = lib.nixosSystem {
				system = "x86_64-linux";
				modules = [ ./configuration.nix ];
			};
		};

  };
}
