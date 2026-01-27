------------
--  Main  --
------------

local function on_character_select_load()
    -- Character Types Enum --

    _G.CT_BOSHI        = Boshi[ 1].tablePos       --- @type CharacterType

    -- Boshi
    character_hook_moveset(CT_BOSHI, HOOK_BEFORE_PHYS_STEP, boshi_before_phys_step)
    character_hook_moveset(CT_BOSHI, HOOK_MARIO_UPDATE, boshi_update)
    character_hook_moveset(CT_BOSHI, HOOK_ON_SET_MARIO_ACTION, boshi_on_set_action)
end

hook_event(HOOK_ON_MODS_LOADED, on_character_select_load)