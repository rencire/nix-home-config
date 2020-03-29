# nix-home-config
Example of using nix for managing user environment packages

Uses:
- [niv][https://github.com/nmattia/niv] to manage dependencies for nix projects.
- [NUR][https://github.com/nix-community/NUR] to pull in user packages not reviewed by nixpkgs members.


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

e.g. for neovim, we can simply specify the configuration via `override`
```nix
# common.nix
with import ./nix {};
let 
  myneovim = nur.rencire.neovim.override {
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
  }
in 
  [
    myneovim
  ]

```




## Folder structure



# External Resources
- https://www.nmattia.com/posts/2018-03-21-nix-reproducible-setup-linux-macos.html 

## Alternatives
- Home Manager (personally haven't used it). However, it seems like a heavyweight solution versus just specifying the config for each package individually.





