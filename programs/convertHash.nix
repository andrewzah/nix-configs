{ pkgs ? import <nixpkgs> {} }:
let
  nixHash = builtins.convertHash {
    hash = "aaa";
    toHashFormat = "sri";
    hashAlgo = "sha256";
  };
in {
  inherit nixHash;
}
