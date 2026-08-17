# Release certification — 3.0.0

**Status:** production-ready canonical package  
**Certified:** 2026-08-16  
**Publisher authority:** public “official” status remains Flounder’s decision; this certification covers the build, integration, and QA evidence.

## Certified compatibility matrix

| Component | Tested version |
|---|---|
| Balatro | 1.0.1o-FULL, Steam build `17459173` |
| LÖVE | 11.5.0 |
| Lovely | 0.9.0 |
| Steamodded | 1.0.0~BETA-1814a |
| Flounder’s Jokers | 3.0.0 |

## Live isolated smoke test

The packaged ZIP was installed beside the exact official Lovely and Steamodded release artifacts in a copied Balatro directory. `LOVELY_MOD_DIR` and Balatro save paths were redirected to a disposable profile; the real game directory and saves were not modified.

The first launch exposed one obsolete Steamodded pre-1.0 registry lookup in the legacy adapter. The adapter was corrected to bind `loc_def` and `calculate` directly to each registered Joker object, preserving every calculation body and gameplay value. The package was rebuilt and retested.

The 3.0 package was installed alone beside official Lovely and Steamodded artifacts in a fresh copied profile. After clearing the copied profile's loader blacklist, the final launch remained stable for 25 seconds and was stopped by verified executable path and PID. Evidence is recorded at `dist/runtime-smoke-20260816-174736/profile6/AppData/Roaming/Balatro/Mods/lovely/log/lovely-2026.08.16-19.49.46.log`.

Its loader log recorded:

- Lovely initialization and Steamodded preflight;
- valid `flounderjokers.json` discovery for version 3.0.0;
- successful environment totals of 53 atlases, 17 sounds, 92 centers, 6 Blinds, and 26 Challenges—exactly +11 atlases, +4 sounds, +7 centers, +4 Blinds, and +6 Challenges over the certified 2.1 matrix;
- no `ERROR`, crash, or StackTrace marker.

## Deterministic release gates

- 60 named Jokers, comprising 54 creator cards and 6 aligned Dice-suite additions;
- 60 exact `71×95` sprites and 60 exact `142×190` companions;
- unique runtime-art hashes with no unregistered Joker sprite in either scale;
- 2 twelve-frame animated seal sheets with occupancy, edge-bleed, centroid-drift, and silhouette-diversity checks;
- 4 canonical Dice objects and complete presentation mapping;
- 3 Decks, 4 Boss Blinds, 4 Vouchers, and 6 immediately available Challenges;
- 11 six-frame progression atlases at both runtime scales;
- 25 creator probability hooks with isolated deterministic RNG streams;
- Reduced Motion and saved presentation-control gates;
- 14 unique Vorbis masters at 44.1 kHz stereo, 0.75–1.05 seconds, −24.5 to −19.5 LUFS, and no peak above −1.0 dBFS;
- measured family compensation plus a bounded 180 ms voice budget for dense multi-card trigger sequences;
- Lua parsing, metadata validation, forbidden-global override checks, package-content checks, and credential-pattern scans.

## Scope of certification

This is a technical release certification, not a claim of endorsement or ownership. It verifies startup, loader registration, assets, audio, animation, packaging, and deterministic source-level gates. Long-run balance remains intentionally creator-authored; no automated test can replace varied full-run playtesting across every optional third-party suit family.
