with import ./nix {};
[
  # NUR
  # https://github.com/nix-community/NUR 
  nur.repos.rencire.neovim

  ## Default packages
  # package management
  niv
  
  # `nix` is removed when we run `nix-env -i ... --remove-all`
  # Hence, we need to install it again.
  nix 

  # Data processing
  xsv     # replaaces column, cut

  # VCS
  git

  # Misc.
  htop
  
  bat     # replaces cat
  exa     # replaces ls, tree
  fasd    # replaces cd

  ripgrep # replaces grep, ag
  fd      # replaces find

  skim    # fuzzy finder, alternative to fzf

  hexyl  # shows hex code
  b16sp   # base16-shell-preview

  cht-sh
  direnv
  httpie
]
