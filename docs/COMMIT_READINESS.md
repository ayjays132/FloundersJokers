# Commit readiness — 2.1.0

**Status:** ready for owner review, commit, and release publication  
**Audited:** 2026-08-16

## Required gates

- [x] 60 registered Jokers and exactly 60 runtime sprite pairs
- [x] Unique 1x and 2x runtime-art hashes; no unused Joker sprite in either runtime atlas directory
- [x] Complete Dice Seal, Cursed Dice Seal, and Spectral integration
- [x] Creator gameplay values and calculation bodies preserved
- [x] Ten decoded, unique, loudness/peak-compliant OGG masters
- [x] High-crest family compensation, pitch/gain clamps, per-card cooldown, and shared voice budget
- [x] Twelve-frame seal animation validation and Reduced Motion gates
- [x] Lua parser, metadata, RNG isolation, and global-override checks
- [x] Isolated Balatro 1.0.1o / Lovely 0.9.0 / Steamodded beta-1814a live launch with zero error markers
- [x] Package inventory and credential-pattern scan
- [x] Runtime certification directories excluded by `.gitignore`

## Repository note

No `.git` directory was present during certification. The source is commit-ready, but the owner must initialize or place this folder in the intended repository before committing. The release ZIP is intentionally not ignored; decide whether the project tracks release binaries or publishes them only as release attachments.

Suggested commit message:

```text
release: finalize Flounder's Jokers Definitive Edition 2.1.0
```

Suggested annotated tag after owner approval:

```text
v2.1.0
```

Public “official” status, remote publication, and tagging remain actions for Flounder or the authorized repository owner.
