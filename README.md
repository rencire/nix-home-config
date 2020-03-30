# nix-home-config
Example of using nix for managing user environment packages

Uses:
- [niv][https://github.com/nmattia/niv] to manage dependencies for nix projects.
- [NUR][https://github.com/nix-community/NUR] to pull in extra user packages that are not part of the nixpkgs repo.


# Usage

## Adding a package
To quickly use this, add a package to `common.nix`:

```nix
with import ./nix {};
[
  cowsay
]

```
Now install packages:

```bash
nix-env -i -f default.nix --remove-all
```

Now packages should be available in shell:

```bash
$ fortune
The only way to amuse some people is to slip and fall on an icy pavement.

```

## Specifying config for each package
This depends on how each package reads their configuration.

e.g. for neovim, we can simply specify the configuration via `override`. See `common.nix`.


## Folder structure



# External Resources
- https://www.nmattia.com/posts/2018-03-21-nix-reproducible-setup-linux-macos.html 

## Alternatives
- Home Manager (personally haven't used it). However, it seems like a heavyweight solution versus just specifying the config for each package individually.


## TODO
- [] add common patterns for importing (e.g. nur, directly from repo from niv, from package repos similar to pypi npm etc.)


