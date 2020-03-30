with import ./nix {};
let 
  myneovim = nur.repos.rencire.neovim.override {
    configure = {
      customRC = ''
        "General vimrc
        set number 
      '';
      packages.main = with vimPlugins; {
        start = [
          {
            plugin = surround;
            vimrc = ''
              "Insert vimrc for surround plugin here
            '';
          }
        ];
      };
    };
  };
in 
  [
    ## Default packages
    # package management
    niv
    
    # `nix` is removed when we run `nix-env -i ... --remove-all`
    # Hence, we need to install it again.
    nix 

    myneovim
  ]
