{
  description = "Need for Speed II SE with bundled game assets (32-bit build)";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";

    self.submodules = true;
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};

        # Pull the 32-bit package set to force the i686 architecture
        pkgs32 = pkgs.pkgsi686Linux;

        nfs2se-pkg = pkgs32.callPackage ./package.nix { inherit self; };
      in
      {
        # Call your standalone default.nix using the 32-bit package set
        packages.default = nfs2se-pkg;

        apps.default = {
          type = "app";
          # This points to the binary that Nix will execute
          # Replace "nfs2se" with the actual name of the binary file generated in $out/bin/
          program = "${nfs2se-pkg}/bin/nfs2se";
        };
      });
}
