#!/usr/bin/env bash
# Generates the Monotional TTFs and the Nerd Font edition from src/Monotional,
# then packages both release archives into release/.
#
# Usage:
#   scripts/make-fonts.sh            build everything into release/
#   scripts/make-fonts.sh --version  print the font version from the sources
#
# Requires FontForge with its Python module, curl and zip. The Nerd Fonts
# patcher is downloaded once into .cache/ unless FONT_PATCHER points to an
# existing font-patcher script.
set -euo pipefail

PATCHER_VERSION=3.4.0

root=$(cd "$(dirname "$0")/.." && pwd)
cd "$root"

sources=(src/Monotional/*.sfd)

# Every source must carry the same version, so a release never mixes styles.
font_version() {
  local versions
  versions=$(sed -n 's/^Version: //p' "${sources[@]}" | sort -u)
  if [[ $(wc -l <<<"$versions") -ne 1 ]]; then
    echo "error: .sfd files disagree on the version:" >&2
    echo "$versions" >&2
    exit 1
  fi
  echo "$versions"
}

if [[ ${1:-} == --version ]]; then
  font_version
  exit 0
fi

version=$(font_version)
fonts_dir=release/Monotional_v$version
nerd_dir=release/Monotional_NF_v$version

patcher=${FONT_PATCHER:-.cache/font-patcher-$PATCHER_VERSION/font-patcher}
if [[ ! -f $patcher ]]; then
  echo "Downloading Nerd Fonts patcher v$PATCHER_VERSION"
  mkdir -p "$(dirname "$patcher")"
  curl -fsSL -o .cache/FontPatcher.zip \
    "https://github.com/ryanoasis/nerd-fonts/releases/download/v$PATCHER_VERSION/FontPatcher.zip"
  unzip -q -o .cache/FontPatcher.zip -d "$(dirname "$patcher")"
  rm .cache/FontPatcher.zip
fi

rm -rf release
mkdir -p "$fonts_dir" "$nerd_dir"

for sfd in "${sources[@]}"; do
  ttf=$fonts_dir/$(basename "${sfd%.sfd}").ttf
  echo "Generating $ttf"
  fontforge -quiet -lang=py \
    -c 'import fontforge, sys; fontforge.open(sys.argv[1]).generate(sys.argv[2])' \
    "$sfd" "$ttf"
done

# --makegroups 4 names the family "Monotional NF" with MonotionalNerdFont-*.ttf
# files, matching earlier releases.
for ttf in "$fonts_dir"/*.ttf; do
  echo "Patching $ttf"
  fontforge -quiet -script "$patcher" --complete --makegroups 4 \
    --quiet --no-progressbars --outputdir "$nerd_dir" "$ttf"
done

for dir in "$fonts_dir" "$nerd_dir"; do
  cp LICENSE COPYRIGHT "$dir"
  (cd release && zip -qr "$(basename "$dir").zip" "$(basename "$dir")")
done

echo "Created:"
ls -1 release/*.zip
