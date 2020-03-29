{ pkgs ? import ./nix {} }:

let
  # List of packages common to both linux and mac
  common = import ./common.nix;

  # Import packages for specific os;
  os = import (if pkgs.stdenv.isDarwin then ./macos.nix else ./linux.nix);

  # Combine list of common and os-specific packages
  homePackages = common ++ os; 
in
  # Return list of packages
  homePackages
