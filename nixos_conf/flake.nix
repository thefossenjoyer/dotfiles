{
  description = "System Config";

  # all the external stuff we want
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-22.05";
    home-manager.url = "github:nix-community/home-manager/release-22.05";

    # tell hm to follow the version of our packages
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };
  
  outputs = { nixpkgs, home-manager, ... }: {
    let
      system = "x86_64-linux";

      pkgs = import nixpkgs {
        inherit system;
        config = { allowUnfree = true; };
      };

      lib = nixpkgs.lib;
      
    in {
      nixosConfiguration = {
        kittycat = lib.nixosSystem {
          inherit system;

          modules = [
            ./system/configuration.nix # import the sys config
          ];
        };
        
      };
    
  };
}
