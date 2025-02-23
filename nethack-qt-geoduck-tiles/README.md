This is a fork of [nethack-qt](https://aur.archlinux.org/packages/nethack-qt).

Besides updating nethack-qt to work for 3.6.7, the only change is the addition
of the geoduck tile set into the nethackdir. To make the tile set used by
default, you should e.g. add the following to `~/.nethackrc`:

```
OPTIONS=tile_file:geoduck25x15-2017.bmp
OPTIONS=tile_height:25
OPTIONS=tile_width:15
QT_TILEHEIGHT=25
QT_TILEWIDTH=15
```
