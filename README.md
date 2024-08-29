# Evan's AUR packages

Now maintained with [aurpublish](https://github.com/eli-schwartz/aurpublish).
Still trying to learn the ropes, yell at me when I do things wrong thanks ♥️

## Notes to self

Make sure `aurpublish` and `pacman-contrib` are installed. Also, if not done
already, use `aurpublish setup` to install the githooks.

How to update:

1. Update `pkgver` and `pkgrel` in `PGKBUILD`.
2. Run `updpkgsums` to update the checksums.
3. Run `makepkg --printsrcinfo > .SRCINFO` to update the `.SRCINFO`.
4. Run `git commit -a`. If done properly, the commit message and info should be
   autocompleted from `.git/hooks/prepare-commit-msg` which is symlinked to
   `/usr/share/aurpublish/prepare-commit-msg.hook`.
5. Run `aurpublish [package-name]` to push changes onto AUR.
