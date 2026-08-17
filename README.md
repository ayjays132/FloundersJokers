# Flounder’s Jokers: Definitive Edition

The creator-faithful, production-grade edition of Flounder’s Balatro work: the complete original Joker catalogue, both Dice Seal mini-mods folded into one canonical pack, a six-card Dice suite built in the same family logic, fully remastered art, animated seal tokens, curated sound direction, and a current Steamodded packaging layer.

![All 60 Jokers](docs/remaster-gallery.png)

## The definitive pack

- **60 Jokers:** all 54 original cards plus one tightly balanced six-card Dice Seal suite.
- **2 canonical animated Seals:** Dice Seal and Cursed Dice Seal, each using a measured twelve-frame atlas.
- **2 canonical Spectrals:** *Oops! All 20s* and *Oops! No 20s*.
- **120 exact Joker sprites:** bespoke `71×95` art and pixel-perfect `142×190` companions.
- **10 mastered sound families:** every Joker receives an intentional cue and stable per-card pitch identity, with anti-spam cooldowns; strict packaging validates codec, duration, loudness, peak, and uniqueness.
- **Current packaging:** JSON metadata, collision-safe `fj` keys, current Atlas/Seal/Consumable/Sound APIs, and the official Steamodded legacy adapter around the creator’s original Joker calculations.
- **Release QA:** named card ledger, syntax checks, art/frame validation, RNG isolation, metadata validation, audio completeness gates, and a clean isolated launch on the certified compatibility matrix.

## What remains exactly Flounder’s

The 54 original cards retain their internal keys, rarities, prices, odds, suit checks, scoring contexts, retrigger behavior, enhancement behavior, dependency gates, and creator-authored family structure. Historical internal spellings remain intact for save compatibility; only player-facing spelling is corrected.

The remaster deliberately does **not** flatten the pack into easier unconditional bonuses. Chance cards still ask for chance. Suit cards still ask for suit construction. Creator cards still respect consumable space. Optional suit families still require the mods that define those suits.

An exact pre-migration snapshot is preserved in [`archive/legacy-code`](archive/legacy-code), and the original visual assets remain in [`archive/original-assets`](archive/original-assets).

## Canonical Dice mechanics

| Object | Effect |
|---|---|
| Dice Seal | Discarding it doubles all listed probabilities, then removes every Dice Seal from the deck. |
| Cursed Dice Seal | Discarding it halves all listed probabilities, then removes every Cursed Dice Seal from the deck. |
| Oops! All 20s | Applies a Dice Seal to exactly one selected card. |
| Oops! No 20s | Applies a Cursed Dice Seal to exactly one selected card. |

The legacy mini-mods achieved those effects by replacing pack opening, collection UI, consumable use, controller input, sprite setup, and seal calculation globally. This edition expresses the same mechanics as native Steamodded objects, so Standard Packs and other mods retain control of their own systems.

## The Dice suite

| Joker | Role | Balance constraint |
|---|---|---|
| Loaded Stone | Chance XMult | Requires a scored sealed card and a successful 1-in-4 roll. |
| Brass Cup | Chips | Requires sealed scoring cards. |
| Payout Gem | Economy | Pays only from sealed scoring cards. |
| House Edge | Conditional XMult | Requires both lucky and cursed seal types in one scoring hand. |
| Double Down | Retrigger | Retriggers only sealed scoring cards. |
| The Croupier | Deck shaping | Non-Blueprint 1-in-6 chance; creates either a blessing or a curse. |

This mirrors the creator’s stone / tool / gem / value / retrigger / transformer rhythm while making the Dice Seals part of an actual deck-building ecosystem.

## Visual and effects direction

Repeated placeholders were replaced with mechanic-specific still lifes and scenes. Every card keeps the recognizable vertical frame language, but its subject, silhouette, materials, lighting, and prop story are individual. Dice Seal tokens use a 12-frame squash/stretch, settle, and traveling-glint cycle rather than a global shader hook, so editions and other render effects remain compatible. Balatro's Reduced Motion setting freezes the added seal animation and suppresses presentation-layer movement.

Successful effects use layered, readable feedback:

1. the native score or status message;
2. restrained card juice, a 320 ms edition-safe native draw-step glint, and one semantic pixel mote following a damped ballistic arc at the actual success point;
3. one family sound with a stable per-card pitch fingerprint;
4. a 90 ms per-card cooldown plus a measured 180 ms shared voice budget, keeping simultaneous triggers clear without silencing them.

The Steamodded mod page includes accessibility controls for card sound cues and kinetic trigger effects. These controls never alter scoring or card logic, and Balatro's global Reduced Motion setting always takes priority.

See [`ART_DIRECTION.md`](ART_DIRECTION.md), [`audio/SFX_DIRECTION.md`](audio/SFX_DIRECTION.md), and [`docs/AUDIO_MASTERING_REPORT.md`](docs/AUDIO_MASTERING_REPORT.md) for the visual system, sound bible, measured band/loudness audit, and ten-cue spectrogram sheet.

## Requirements and installation

1. Install Balatro with Lovely and **Steamodded 1.0.0-beta-1800 or newer**.
2. Copy this entire folder into Balatro’s `Mods` directory as one folder.
3. Confirm the final path contains `flounderjokers.json`, `main.lua`, `modules`, and `assets` directly beneath it.
4. Launch Balatro and open **Mods → Flounder’s Jokers** to confirm version `2.1.0`.

Do not install `Dice-Seals-main` separately; it is preserved only as source history and is already part of the definitive pack.

Optional collaboration families appear only when their defining mods are present: Codex Arcanum, MoreFluff, Reverie, Musical Suit, Crowns Suit, and SixSuit.

## Verification

Run the full release gate from PowerShell:

```powershell
.\tools\qa-release.ps1
```

The gate requires all 60 Joker art pairs, both animated seal sheets, all canonical Dice objects, all ten audio masters, valid metadata, isolated RNG, safe override behavior, and parseable Lua. The individual review is recorded in [`docs/CARD_AUDIT.md`](docs/CARD_AUDIT.md); the exact tested loader/game matrix and clean-launch evidence are recorded in [`docs/RELEASE_CERTIFICATION.md`](docs/RELEASE_CERTIFICATION.md), with the owner handoff in [`docs/COMMIT_READINESS.md`](docs/COMMIT_READINESS.md).

To rebuild the gallery or seal animation sheets:

```powershell
.\tools\build-gallery.ps1
.\tools\build-seal-animation.ps1 -SourceName dice_seal.png -OutputName dice_seal_animated.png
```

To securely generate audio, run the interactive finalizer. It hides keyboard input, keeps the credential only in the current process, generates and masters every cue, runs strict QA, emits the release ZIP, then clears the credential:

```powershell
.\tools\finalize-release.ps1
```

The generator uses ElevenLabs `eleven_text_to_sound_v2`, keeps credentials out of the repository, trims every cue to the same loudness target, high/low-passes the masters, and exports Steamodded-ready OGG files.

## Credits and provenance

- **Original mod, all original mechanics, card identities, keys, family logic, and Dice Seal concepts:** Flounder
- **Definitive-edition art, compatibility migration, animation, audio direction, QA tooling, and documentation:** produced in service of Flounder’s original work

No new license is asserted. Distribution rights and attribution remain subject to the original creator’s terms.
