-- name: [CS] \\#0066FF\\Boshi
-- description: [CS] \\#0066FF\\Boshi\n\n\\#FFFFFF\\This mod adds \\#0066FF\\Boshi \\#FFFFFF\\from \nSuper Mario RPG: Legend of the\nSeven Stars into sm64coopdx!\n\n\\#F54E59\\Model Credits: \nBlueKazoo, Brobgonal Second & ER1CK\n\n\\#5FF54E\\Voice Actors: \nAngelicMiracles "Yuyake"\n\n\\#0066FF\\Moveset Credits:\nXLuigiGamerX, Squishy6094, JerThePear & Baconator2558\n\n\\#ffff00\\Animation credits:\nSharen\n\n\\#ffffff\\Requires \\#00ff00\\Character Select \\#ff6868\\enabled!
local TEXT_PACK_NAME = "Boshi"

if not _G.charSelectExists then
    djui_popup_create("[CS]\\#0066FF\\Boshi \\#ffffa0\\requires\nCharacter Select to be enabled.\n\nPlease rehost with it enabled.", 4)
    return
end

-- Characters are stored in a table for ease of addition

csBoshi = {
    -----------
    -- Boshi --
    -----------
    {
        name = "Boshi",
        description = "''What're YOU lookin' at? If you wanna challenge me, you have to bring cookies!'' ----------------------- Boshi is a lone Blue Yoshi and the rival of Yoshi. Like many other yoshis, Boshi can speak only the Yoshi language, having a deeper voice than most others.",
        credits = "BlueKazoo, Brob2nd & ER1CK / VA: FunkyLion 'Yuyake'",
        color = { r = 0, g = 100, b = 255 },
        model = smlua_model_util_get_id("boshi_geo"),
        forceChar = CT_MARIO,
        lifeIcon = get_texture_info("icon-boshi"),
        camScale = 1,
        offset = 0,
        caps = {
            normal = smlua_model_util_get_id("boshi_cap_geo"),
            wing = smlua_model_util_get_id("boshi_wing_cap_geo"),
            metal = smlua_model_util_get_id("boshi_metal_cap_geo"),
            metalWing = smlua_model_util_get_id("boshi_metal_wing_cap_geo")
        },
        palette = {
            [PANTS]  = { r = 0xFF, g = 0x00, b = 0xFF },
            [SHIRT]  = { r = 0x00, g = 0x66, b = 0xFF },
            [GLOVES] = { r = 0xFF, g = 0xFF, b = 0xFF },
            [SHOES]  = { r = 0x89, g = 0x00, b = 0x0F },
            [HAIR]   = { r = 0xFF, g = 0x66, b = 0x00 },
            [SKIN]   = { r = 0xFF, g = 0xDE, b = 0x39 },
            [CAP]    = { r = 0x00, g = 0x66, b = 0xFF },
            [EMBLEM] = { r = 0xFF, g = 0x00, b = 0x00 },
        },
        voices = {
            [CHAR_SOUND_ATTACKED] = "boshi_attacked.ogg",
            [CHAR_SOUND_COUGHING1] = "boshi_coughing1.ogg", -- missing all three
            [CHAR_SOUND_COUGHING2] = "boshi_coughing2.ogg", -- missing all three
            [CHAR_SOUND_COUGHING3] = "boshi_coughing3.ogg", -- missing all three
            [CHAR_SOUND_DOH] = "boshi_doh.ogg",
            [CHAR_SOUND_DROWNING] = "boshi_drowning.ogg",
            [CHAR_SOUND_DYING] = "boshi_dying.ogg",
            [CHAR_SOUND_EEUH] = "boshi_euuh.ogg",
            [CHAR_SOUND_GROUND_POUND_WAH] = "boshi_ground_pound_wah.ogg",
            [CHAR_SOUND_HAHA] = "boshi_haha.ogg",
            [CHAR_SOUND_HAHA_2] = "boshi_haha2.ogg",
            [CHAR_SOUND_HERE_WE_GO] = "boshi_herewego.ogg",
            [CHAR_SOUND_HOOHOO] = "boshi_hoohoo.ogg",
            [CHAR_SOUND_HRMM] = "boshi_hrmm.ogg",
            [CHAR_SOUND_IMA_TIRED] = "boshi_imatired.ogg",
            [CHAR_SOUND_MAMA_MIA] = "boshi_mamamia.ogg",
            [CHAR_SOUND_LETS_A_GO] = "boshi_letsago.ogg",
            [CHAR_SOUND_ON_FIRE] = "boshi_on_fire.ogg",
            [CHAR_SOUND_OOOF] = "boshi_ooof.ogg",
            [CHAR_SOUND_OOOF2] = "boshi_ooof2.ogg",
            [CHAR_SOUND_PANTING] = "boshi_panting.ogg",
            [CHAR_SOUND_PANTING_COLD] = "boshi_panting_cold.ogg",
            [CHAR_SOUND_PUNCH_HOO] = "boshi_punch_hoo.ogg",
            [CHAR_SOUND_PUNCH_WAH] = "boshi_punch_wah.ogg",
            [CHAR_SOUND_PUNCH_YAH] = "boshi_punch_yah.ogg",
            [CHAR_SOUND_SO_LONGA_BOWSER] = "boshi_solonga_bowser.ogg",
            [CHAR_SOUND_SNORING1] = "boshi_snoring1.ogg",
            [CHAR_SOUND_SNORING2] = "boshi_snoring2.ogg",
            [CHAR_SOUND_SNORING3] = {"boshi_snoring2.ogg", "boshi_snoring1.ogg", "boshi_snoring3.ogg"},
            [CHAR_SOUND_TWIRL_BOUNCE] = "boshi_twirl_bounce.ogg",
            [CHAR_SOUND_UH] = "boshi_uh.ogg",
            [CHAR_SOUND_UH2] = "boshi_uh2.ogg",
            [CHAR_SOUND_UH2_2] = "boshi_uh2_2.ogg",
            [CHAR_SOUND_WAAAOOOW] = "boshi_waaaooow.ogg",
            [CHAR_SOUND_WAH2] = "boshi_wah.ogg",
            [CHAR_SOUND_WHOA] = "boshi_whoa.ogg",
            [CHAR_SOUND_YAHOO] = "boshi_yahoo.ogg",
            [CHAR_SOUND_YAWNING] = "boshi_yawning.ogg",
            [CHAR_SOUND_YAHOO_WAHA_YIPPEE] = { "boshi_yahoo.ogg", "boshi_yahoo1.ogg", "boshi_yahoo2.ogg", "boshi_yahoo3.ogg", "boshi_yahoo4.ogg", "boshi_yahoo5.ogg" },
            [CHAR_SOUND_YAH_WAH_HOO] = { "boshi_yah_wah_hoo1.ogg", "boshi_yah_wah_hoo2.ogg", "boshi_yah_wah_hoo3.ogg"},
            [CHAR_SOUND_HELLO] = "boshi_hello.ogg"
        },
    },
}    

local TEXT_MOVESET     = " (Moveset)"
local CSloaded = false
local function on_character_select_load()
    for i = 1, #csBoshi do
        local char = csBoshi[i]
        char.tablePos = _G.charSelect.character_add(char.name, char.description, char.credits, char.color, char.model, char.forceChar, char.lifeIcon, char.camScale, char.offset, char.meter)
        if char.caps then _G.charSelect.character_add_caps(char.model, char.caps) end
        if char.voices then _G.charSelect.character_add_voice(char.model, char.voices) end
        if char.palette then _G.charSelect.character_add_palette_preset(char.model, char.palette) end
        if char.anims then _G.charSelect.character_add_animations(char.model, char.anims) end
        -- if char.meter then _G.charSelect.character_add_health_meter(char.model, char.meter) end
    end

    _G.charSelect.credit_add(TEXT_PACK_NAME, "Brobgonal Second", "Lead Dev")
    _G.charSelect.credit_add(TEXT_PACK_NAME, "Sharen", "Animation")
    _G.charSelect.credit_add(TEXT_PACK_NAME, "BlueKazoo", "Models")
    _G.charSelect.credit_add(TEXT_PACK_NAME, "ER1CK", "Models/Recolorability")
    _G.charSelect.credit_add(TEXT_PACK_NAME, "Squishy6094", "Code Rewrite")
    _G.charSelect.credit_add(TEXT_PACK_NAME, "FunkyLion", "Voice Actor")
    _G.charSelect.credit_add(TEXT_PACK_NAME..TEXT_MOVESET, "xLuigiGamerx", "Original Moveset Creator")
    _G.charSelect.credit_add(TEXT_PACK_NAME..TEXT_MOVESET, "Baconator2558", "Tweaks and help")
    _G.charSelect.credit_add(TEXT_PACK_NAME..TEXT_MOVESET, "Squishy6094", "Ground Pound Cancel")
    _G.charSelect.credit_add(TEXT_PACK_NAME..TEXT_MOVESET, "JerThePear", "Ground Pound Jump")

    CSloaded = true
end

local function on_character_sound(m, sound)
    if not CSloaded then return end
    for i = 1, #csBoshi do
        if _G.charSelect.character_get_voice(m) == csBoshi[i].voices then return _G.charSelect.voice.sound(m, sound) end
    end
end

hook_event(HOOK_ON_MODS_LOADED, on_character_select_load)
hook_event(HOOK_CHARACTER_SOUND, on_character_sound)
--hook_event(HOOK_MARIO_UPDATE, mario_update)
