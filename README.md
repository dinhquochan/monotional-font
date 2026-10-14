# Monotional

[![Latest release](https://img.shields.io/github/v/release/dinhquochan/monotional-font)](https://github.com/dinhquochan/monotional-font/releases/latest)
[![License: OFL-1.1](https://img.shields.io/badge/license-OFL--1.1-blue)](LICENSE)

A humanist monospace font for programming and technical work, with full
Vietnamese support.

Monotional is based on [DejaVu Sans Mono](https://github.com/dejavu-fonts/dejavu-fonts)
and inspired by André Berg's [Meslo](https://github.com/andreberg/Meslo-Font).
This repository is a fork of the original
[Monotional](https://github.com/regularhunter/monotional-font) by Hunter Wardlaw.
It adds every Vietnamese precomposed letter and ships the dotted-zero family only.

## Features

- **Four styles:** Regular, Bold, Italic and Bold Italic.
- **Built for code:** a dotted zero and reworked `1 i - _ = ' " ^ # * % @ ~`
  glyphs compared with DejaVu Sans Mono.
- **Full Vietnamese:** all 90 letters in U+1EA0–U+1EF9, including stacked tone
  marks on `ă â ê ô` such as `ẳ ầ ễ ộ`.
- **Wide coverage:** more than 3,300 glyphs across Latin, Greek, Cyrillic, box
  drawing and Braille.
- **Nerd Font edition:** a separate family patched with the complete
  [Nerd Fonts](https://www.nerdfonts.com) icon set for terminals and prompts.

## Download

Get the archives from the
[latest release](https://github.com/dinhquochan/monotional-font/releases/latest).

| Archive | Font family | Best for |
| --- | --- | --- |
| `Monotional_vX.Y.zip` | `Monotional` | Editors, IDEs and documents |
| `Monotional_NF_vX.Y.zip` | `Monotional NF` | Terminals and shell prompts with icons |

## Install

- **macOS:** open each `.ttf` file and click **Install Font**, or copy the files
  to `~/Library/Fonts`.
- **Windows:** select the `.ttf` files, right-click and choose **Install**.
- **Linux:** copy the files to `~/.local/share/fonts`, then run `fc-cache -f`.

Then select the family by name. In VS Code, for example:

```json
{
  "editor.fontFamily": "Monotional",
  "terminal.integrated.fontFamily": "Monotional NF"
}
```

## Build from source

The sources are FontForge files in [`src/Monotional`](src/Monotional). With
FontForge and its Python module installed, generate the TTFs with:

```sh
mkdir -p fonts
for sfd in src/Monotional/*.sfd; do
  fontforge -quiet -lang=py \
    -c 'import fontforge, sys; fontforge.open(sys.argv[1]).generate(sys.argv[2])' \
    "$sfd" "fonts/$(basename "${sfd%.sfd}").ttf"
done
```

The Nerd Font edition is made by running the
[Nerd Fonts patcher](https://github.com/ryanoasis/nerd-fonts) on
each generated TTF with `--complete --makegroups 4`.

Built fonts are published as release assets and are not committed; `fonts/`
and `nerd-fonts/` are ignored by git.

## Changelog

See [CHANGELOG.md](CHANGELOG.md).

## Credits

- Hunter Wardlaw for creating Monotional.
- Jim Lyles and Bitstream for the Bitstream Vera family, and the DejaVu
  project for DejaVu Sans Mono.
- André Berg for Meslo, which inspired several of Monotional's glyphs.
- [bentodvictor](https://github.com/bentodvictor) for the original Nerd Font
  builds of Monotional.
- George Williams and contributors for [FontForge](https://fontforge.org).

## License

Monotional is licensed under the [SIL Open Font License 1.1](LICENSE).

- Copyright © 2026 Dinh Quoc Han
- Copyright © 2025 Hunter Wardlaw
- Copyright © 2014 The Fira Code Project Authors
- Copyright © 2006 Tavmjong Bah
- Copyright © 2003 Bitstream, Inc. DejaVu changes are in the public domain.

Bitstream Vera is a trademark of Bitstream, Inc. The full upstream notices are
in [COPYRIGHT](COPYRIGHT). All other brands and product names are trademarks or
registered trademarks of their respective owners.
