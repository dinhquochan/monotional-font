# Changelog

## v2.11

First release from this fork.

 * Add full Vietnamese support: 46 precomposed letters with hook above
   and stacked circumflex/breve tone marks (U+1EA0–U+1EF9)
 * Center the italic and bold-italic hook above mark (U+0309)
 * Ship the dotted-zero family only; the SZ (slashed zero) and AZ
   (ambiguous zero) variants are no longer published

## v2.10

* Rescale ` % ` glyph to 104% of original size

## v2.9

 * Revert scaling of ` % ` glyph

## v2.8

 * Align ` % ` and ` ~ ` to integer coordinates
 * Scale ` % ` glyph to 104% of original size

## v2.7

 * Rework ` % ` glyph for all fonts

## v2.6

 * Correct thickness of regular and bold-italic ` figuredash `

## v2.5

 * Rework all versions of ` 1 ` glyph

## v2.4

 * Center italic and bold-italic glyph for ` | `
 * Add SZ (slashed zero) and AZ (ambiguous zero) variants

## v2.3

 * Add unique italic and bold-italic glyph for ` | `

## v2.2

 * Add unique italic and bold-italic glyph for ` ' ` and ` " `

## v2.1

 * Fix incorrect positioning of regular ` ^ ` glyph

## v2.0

 * Revise all dash glyphs for consistency
 * Add unique italic and bold-italic ` + ` glyph
 * Add unique italic and bold-italic ` = ` glyph
 * Increase height of bold and bold-italic glyph for ` ' ` and ` " `
 * Slight adjustment to bold and bold-italic ` ^ ` glyph
 * Slight adjustment to italic and bold-italic ` 4 ` glyph

## v1.9

 * Rework bold, italic, and bold-italic ` 1 ` glyph to match regular version
 * Rework bold-italic ` # ` glyph to match bold version
 * Slight adjustment to italic ` ' ` and ` * ` glyph
 * Slight adjustment to bold and bold-italic ` - ` glyph
 * Slight adjustment to italic and bold-italic ` 4 ` glyph

## v1.8

 * Increase regular and italic ` ~ ` glyph weight

## v1.7

 * Change license to SIL OFL 1.1
 * Remove font instructions inherited from DejaVu Sans Mono causing 
rendering issues in Windows (issue #1)
 * Small adjustment to italic ` @ ` glyph
 * Rework italic and bold-italic ` # ` glyph to match non-italic 
versions
 * Change ` ~ ` glyph style to emulate Fira Code

## v1.6

 * Remove fi and fl ligature
 * Fix swapped italic characters ` U+04CB/U+04CC ` <‒> ` U+04F6/U+04F7 `

## v1.5

 * Small adjustment to ` 4 ` glyph

## v1.4

 * Small adjustment to ` @ ` glyph

## v1.3

 * Small adjustment to ` % ` glyph

## v1.2

 * Re-implement Monotional on top of DejaVu Sans Mono from scratch to 
fix display bug in MS Word. ` ~ @ ` glyph not re-implemented
 * Revert \` glyph width from v1.1 so that legibility is preserved for accented 
characters

## v1.1

 * Widen \` glyph for all fonts

## v1.0

 * First release! Based on DejaVu Sans Mono 2.37.
 * The main differences are with the following characters: ` 1 i - _ = ' " ^ # * % @ ~ `
