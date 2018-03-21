# egoexpress does dotfiles

This is largely based on the excellent work of [Zack Holman](https://github.com/holman) 
and his awesome [dotfiles](https://github.com/holman/dotfiles) project.
Check out this project to learn more about the philosophy behind it.

I changed some minor facts and took the bits from the original project that I liked.
I then added oh-my-zsh on top of it (because that's the zsh environment I'm used too),
so we now have some kind of Frankenstein zsh monster. :)
A method to better handle private data (within a separate `~/.private` repository)
was added as well.

## Topics

Everything's built around topic areas. If you're adding a new area to your
forked dotfiles — say, "Java" — you can simply add a `java` directory and put
files in there. Anything with an extension of `.zsh` will get automatically
included into your shell. Anything with an extension of `.symlink` will get
symlinked without extension into `$HOME` when you run `dotfiles/scripts/bootstrap`.

## Components

There's a few special files in the hierarchy.

- **topic/\*.zsh**: Any files ending in `.zsh` get loaded into your
  environment.
- **topic/path.zsh**: Any file named `path.zsh` is loaded first and is
  expected to setup `$PATH` or similar.
- **topic/completion.zsh**: Any file named `completion.zsh` is loaded
  last and is expected to setup autocomplete.
- **topic/install.sh**: Any file named `install.sh` is executed when you 
  run `dotfiles/scripts/install`. 
  To avoid being loaded automatically, its extension is `.sh`, not `.zsh`.
- **topic/\*.symlink**: Any file ending in `*.symlink` gets symlinked into
  your `$HOME`. This is so you can keep all of those versioned in your dotfiles
  but still keep those autoloaded files in your home directory. These get
  symlinked in when you run `dotfiles/scripts/bootstrap`.

## Private Information

To handle private information a separate filesystem hierarchy under
`~/.private` was introduced. You can place `.zsh` files which are loaded
through `dotfiles/scripts/install` as well. The `.symlink` function
works here as well.

I also introduced a `.relative` naming scheme to mix in configuration files
with private information. So, if you e.g. use WeeChat, some configuration
files contain private information you don't want to have in a public repo.
So you can split the `.weechat` dir as following:

- **~/.dotfiles/weechat/weechat.symlink** contains all the files without
  private infos. This dir will be linked at `~/.weechat`.
- **~/.private/weechat/weechat.relative** contains all the other files
  with private information. Symlinks in `~/.weechat` will be created
  for each of these files.

## Install

Run this:

```sh
git clone https://github.com/egoexpress/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
dotfiles/scripts/bootstrap
```

This will symlink the appropriate files in `.dotfiles` to your home directory.
Everything is configured and tweaked within `~/.dotfiles`.

The main file you'll want to change right off the bat is `zsh/zshrc.symlink`,
which sets up a few paths that'll be different on your particular machine.

`dot` is a simple script that installs some dependencies, sets sane
defaults, and so on. Tweak this script, and occasionally run `dot` from
time to time to keep your environment fresh and up-to-date. You can find
this script in `dotfiles/bin/`.

## Thanks

The original dotfiles project is released under the MIT license and
copyrighted by Zack Holman. See that [project](https://github.com/holman/dotfiles)
for any additional info.
