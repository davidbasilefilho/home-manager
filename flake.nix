{
  description = "Home Manager configuration of basile";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      specialArgs = {
        username = "basile";
      };
    in {
      homeConfigurations."basile" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules.
        modules = [ ./home.nix ];

        # Pass specialArgs to home.nix using extraSpecialArgs
        extraSpecialArgs = specialArgs;
      };
    };
}
