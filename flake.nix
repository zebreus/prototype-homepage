{
  description = "Coreboot homepage";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:nixos/nixpkgs";
  };

  outputs =
    { self
    , nixpkgs
    , flake-utils
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        name = "coreboot-homepage";

        devShell = pkgs.mkShell {
          buildInputs = [ pkgs.nodejs ];
          shellHook = with pkgs; ''
            npm install
          '';
        };

        formatter = pkgs.nixfmt-rfc-style;
      }
    );
}
