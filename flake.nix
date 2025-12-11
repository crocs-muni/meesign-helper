{
  description = "MeeSign Helper";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      ...
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        overlays = [];
        pkgs = import nixpkgs { inherit system overlays; };
        meesign-helper = pkgs.callPackage ./default.nix { };
      in
      with pkgs; {
        devShells = pkgs.mkShell {
          buildInputs = [ maven ];
        };
        packages = {
          inherit meesign-helper;
          default = meesign-helper;
        };
      }
    );
}
