{ pkgs, ... }:
let
  # Force the 32-bit package set
  pkgs32 = pkgs.pkgsi686Linux;
in
{
  nfs2se = pkgs32.callPackage ./default.nix { self = ./.; };
}
