# Building and releasing

The sources are FontForge files in [`src/Monotional`](../src/Monotional).
[`scripts/make-fonts.sh`](../scripts/make-fonts.sh) turns them into the release
archives, and the [Release workflow](../.github/workflows/release.yml) runs the
same script on GitHub Actions.

## Build locally

Install [FontForge](https://fontforge.org) with its Python module (on Debian
and Ubuntu: `fontforge python3-fontforge`), plus `curl` and `zip`. Then run:

```sh
scripts/make-fonts.sh
```

The script:

1. Reads the version from the `.sfd` files and stops if they disagree.
2. Generates the four TTFs. Hinting comes from the `.sfd` files.
3. Downloads the Nerd Fonts patcher v3.4.0 into `.cache/` on first use (set
   `FONT_PATCHER` to use an existing `font-patcher` instead) and patches each
   TTF with `--complete --makegroups 4`. That flag gives the family name
   `Monotional NF` and file names such as `MonotionalNerdFont-Regular.ttf`.
4. Packages two archives into `release/`, each with the four TTFs plus
   `LICENSE` and `COPYRIGHT` inside a versioned folder:

| Archive | Contents |
| --- | --- |
| `Monotional_vX.Y.zip` | `Monotional*.ttf` |
| `Monotional_NF_vX.Y.zip` | `MonotionalNerdFont-*.ttf` |

`release/` and `.cache/` are ignored by git. Built fonts are never committed.

## Release

1. In a pull request, set the new version in all four `.sfd` files (the
   `Version:` line and the `"Version X.Y"` entry in `LangName`) and add a
   `## vX.Y` section to [CHANGELOG.md](../CHANGELOG.md). The workflow builds
   the fonts on the pull request and attaches the archives to the run, so they
   can be tested before merging.
2. Merge the pull request, then tag the merge commit and push the tag:

   ```sh
   git switch main && git pull
   git tag vX.Y
   git push origin vX.Y
   ```

3. The workflow checks that the tag matches the font version, builds the
   fonts, and creates the GitHub release with both archives. The release notes
   are the `## vX.Y` section of CHANGELOG.md, and the workflow fails if that
   section is missing.

The workflow can also be started by hand from the Actions tab to build the
archives without releasing.
