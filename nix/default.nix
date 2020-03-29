{ sources ? import ./sources.nix }:

let
  # Use this when want to reference unstable packages
  nixpkgs-unstable = import sources.nixpkgs-unstable {};

  # Overlay related to package managemnt
  pkgMgmtOverlay = self: super:
    {
      nur = import sources.NUR {pkgs = super;};
      niv = import sources.niv {};
    };

  # Overlay with Custom packages
  customPkgsOverlay = self: super:
    { 
      # Insert custom packages here
    };
in 
  import sources.nixpkgs 
    { 
      overlays = [ 
        pkgMgmtOverlay
	customPkgsOverlay
      ] ;
      config = {
        allowUnfree = true; 
      }; 
    }
  
