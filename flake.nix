{
  description = "CI/CD pipeline example for a Spring Boot Java app, powered by Nix";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    nixpkgs,
    flake-utils,
    nix-vscode-extensions,
    ...
  }: flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      devShells.default = pkgs.mkShell {
        packages = [
          pkgs.jdk
          pkgs.maven
          #vscode
        ];
      };
  });
}
