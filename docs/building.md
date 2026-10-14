# Building and releasing

The sources are FontForge files in [`src/Monotional`](../src/Monotional). The
repository has no build script; the steps below are run by hand from the
repository root.

## Requirements

- [FontForge](https://fontforge.org) with its Python module (on Debian and
  Ubuntu: `fontforge python3-fontforge`).
- The Nerd Fonts patcher v3.4.0, from `FontPatcher.zip` on the
  [Nerd Fonts release page](https://github.com/ryanoasis/nerd-fonts/releases/tag/v3.4.0).

## Version

Before a release, set the new version in all four `.sfd` files: the `Version:`
line and the `"Version X.Y"` entry in `LangName`. Add the release notes to
[CHANGELOG.md](../CHANGELOG.md).

## Generate the fonts

```sh
mkdir -p fonts
for sfd in src/Monotional/*.sfd; do
  fontforge -quiet -lang=py \
    -c 'import fontforge, sys; fontforge.open(sys.argv[1]).generate(sys.argv[2])' \
    "$sfd" "fonts/$(basename "${sfd%.sfd}").ttf"
done
```

Hinting comes from the `.sfd` files, so no extra hinting step is needed.

## Patch the Nerd Font edition

With the patcher unpacked to `/path/to/FontPatcher`:

```sh
mkdir -p nerd-fonts
for ttf in fonts/*.ttf; do
  fontforge -script /path/to/FontPatcher/font-patcher \
    --complete --makegroups 4 --outputdir nerd-fonts "$ttf"
done
```

`--makegroups 4` is what gives the family name `Monotional NF` and file names
such as `MonotionalNerdFont-Regular.ttf`. Without it the family is named
`Monotional Nerd Font`.

## Package and publish

Each release has two archives. Both contain the four TTFs plus `LICENSE` and
`COPYRIGHT` inside a versioned folder:

| Archive | Folder | Fonts |
| --- | --- | --- |
| `Monotional_vX.Y.zip` | `Monotional_vX.Y/` | `fonts/*.ttf` |
| `Monotional_NF_vX.Y.zip` | `Monotional_NF_vX.Y/` | `nerd-fonts/*.ttf` |

Upload both archives as assets of a GitHub release tagged `vX.Y`. Built fonts
and archives are never committed; `fonts/` and `nerd-fonts/` are ignored by
git.
