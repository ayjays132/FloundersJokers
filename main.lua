local mod = SMODS.current_mod

local defaults = { sfx_enabled = true, sfx_volume = 0.34, kinetic_effects = true }

mod.config = mod.config or {}
for key, value in pairs(defaults) do
    if mod.config[key] == nil then mod.config[key] = value end
end

-- The catalogue remains creator-authored 0.9.8 code. Steamodded maintains an
-- official adapter for it; wrapping just this file preserves its calculation
-- semantics while every new component uses the current object API.
SMODS.compat_0_9_8.with_compat(function()
    assert(SMODS.load_file('FloundersJokers.lua'))()
    for key, initializer in pairs(SMODS.compat_0_9_8.init_queue) do
        initializer()
        SMODS.compat_0_9_8.init_queue[key] = nil
    end
end)

-- Dice Seals and their six-card suite are canonical creator content.
assert(SMODS.load_file('modules/dice_seals.lua'))()
assert(SMODS.load_file('modules/dice_suite.lua'))()

-- Presentation polish is canonical; volume remains configurable in the saved
-- mod config for accessibility and streamer workflows.
assert(SMODS.load_file('modules/sounds.lua'))()
assert(SMODS.load_file('modules/presentation.lua'))()
assert(SMODS.load_file('modules/config_ui.lua'))()
