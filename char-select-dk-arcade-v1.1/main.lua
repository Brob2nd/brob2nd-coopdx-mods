-- name: [CS] DK Arcade Pack V1.1
-- description: [CS] DK Arcade Pack V1.1\n\nThis mod adds Jumpman and Stanley from the Donkey Kong, Donkey Kong Jr. and Donkey Kong 3 arcade videogames\ninto sm64coopdx!\n\n\\#f54e59\\Credits: \nAlexXRGames, ThaGurlTilly, \n\\#008800\\Squishy6094, TheGreatMario64,\n\\#5ff54e\\BlueKazoo, ER1CK\n\\#ffffff\\& Brobgonal Second\n\n\\#ffffff\\Requires \\#00ff00\\Character Select \\#ff6868\\enabled!

local globalModName = "DK Arcade Pack"
if not _G.charSelectExists then
    djui_popup_create("\\#ffffdc\\\n"..globalModName.."\nRequires the Character Select Mod\nto use as a Library!\n\nPlease turn on the Character Select Mod and Restart the Room!", 6)
    return
end

local E_MODEL_JUMPMAN = smlua_model_util_get_id("jumpman_geo")
local E_MODEL_STANLEY = smlua_model_util_get_id("stanley_geo")
local E_MODEL_JUMPMAN_ALT_1 = smlua_model_util_get_id("jumpman_alt_geo")
local E_MODEL_STANLEY_ALT_1 = smlua_model_util_get_id("stanley_alt_geo")
local E_MODEL_JUMPMAN_ALT_2 = smlua_model_util_get_id("jumpman_alt2_geo")
local E_MODEL_STANLEY_ALT_2 = smlua_model_util_get_id("stanley_alt2_geo")

local TEX_JUMPMAN = get_texture_info("jumpman-icon")
local TEX_STANLEY = get_texture_info("stanley-icon")

local VOICETABLE_JUMPMAN = {
    [CHAR_SOUND_ATTACKED] = "jumpman_thwomp.ogg",
    [CHAR_SOUND_DOH] = "jumpman_thwomp.ogg",
    [CHAR_SOUND_DROWNING] = "jumpman_miss.ogg",
    [CHAR_SOUND_DYING] = "jumpman_miss.ogg",
    [CHAR_SOUND_GROUND_POUND_WAH] = "jumpman_kick.ogg",
    [CHAR_SOUND_HAHA] = "jumpman_pause.ogg",
    [CHAR_SOUND_HAHA_2] = "jumpman_kick.ogg",
    [CHAR_SOUND_HERE_WE_GO] = "jumpman_herewego.ogg",
    [CHAR_SOUND_HOOHOO] = "jumpman_thwomp.ogg",
    [CHAR_SOUND_MAMA_MIA] = "jumpman_kick.ogg",
    [CHAR_SOUND_OKEY_DOKEY] = "jumpman_kick.ogg",
    [CHAR_SOUND_ON_FIRE] = "jumpman_pause.ogg",
    [CHAR_SOUND_OOOF] = "jumpman_thwomp.ogg",
    [CHAR_SOUND_OOOF2] = "jumpman_thwomp.ogg",
    [CHAR_SOUND_PUNCH_HOO] = "jumpman_kick.ogg",
    [CHAR_SOUND_PUNCH_WAH] = "jumpman_thwomp.ogg",
    [CHAR_SOUND_PUNCH_YAH] = "jumpman_thwomp.ogg",
    [CHAR_SOUND_SO_LONGA_BOWSER] = "jumpman_fall.ogg",
    [CHAR_SOUND_TWIRL_BOUNCE] = "jumpman_pause.ogg",
    [CHAR_SOUND_WAAAOOOW] = "jumpman_fall.ogg",
    [CHAR_SOUND_WAH2] = "jumpman_kick.ogg",
    [CHAR_SOUND_WHOA] = "jumpman_thwomp.ogg",
    [CHAR_SOUND_YAHOO] = "jumpman_kick.ogg",
    [CHAR_SOUND_YAHOO_WAHA_YIPPEE] = "jumpman_herewego.ogg",
    [CHAR_SOUND_YAH_WAH_HOO] = "jumpman_jump.ogg",
    [CHAR_SOUND_YAWNING] = "jumpman_pause.ogg",
}
local VOICETABLE_STANLEY = {
    [CHAR_SOUND_ATTACKED] = "stanley_attacked.ogg",
    [CHAR_SOUND_DOH] = "stanley_yah.ogg",
    [CHAR_SOUND_DROWNING] = "stanley_miss.ogg",
    [CHAR_SOUND_DYING] = "stanley_miss.ogg",
    [CHAR_SOUND_GROUND_POUND_WAH] = "stanley_haha.ogg",
    [CHAR_SOUND_HAHA] = "stanley_haha.ogg",
    [CHAR_SOUND_HAHA_2] = "stanley_haha.ogg",
    [CHAR_SOUND_HERE_WE_GO] = "stanley_yahoo.ogg",
    [CHAR_SOUND_HOOHOO] = "stanley_hoohoo.ogg",
    [CHAR_SOUND_MAMA_MIA] = "stanley_mamamia.ogg",
    [CHAR_SOUND_OKEY_DOKEY] = "stanley_yahoo.ogg",
    [CHAR_SOUND_ON_FIRE] = "jumpman_pause.ogg",
    [CHAR_SOUND_OOOF] = "stanley_oof.ogg",
    [CHAR_SOUND_OOOF2] = "stanley_oof.ogg",
    [CHAR_SOUND_PUNCH_HOO] = "stanley_hoo.ogg",
    [CHAR_SOUND_PUNCH_WAH] = "stanley_yah_wah.ogg",
    [CHAR_SOUND_PUNCH_YAH] = "stanley_yah_wah.ogg",
    [CHAR_SOUND_SO_LONGA_BOWSER] = "stanley_fall.ogg",
    [CHAR_SOUND_TWIRL_BOUNCE] = "jumpman_pause.ogg",
    [CHAR_SOUND_WAAAOOOW] = "stanley_fall.ogg",
    [CHAR_SOUND_WAH2] = "jumpman_kick.ogg",
    [CHAR_SOUND_WHOA] = "stanley_haha.ogg",
    [CHAR_SOUND_YAHOO] = "stanley_yah.ogg",
    [CHAR_SOUND_YAHOO_WAHA_YIPPEE] = "stanley_yahoo.ogg",
    [CHAR_SOUND_YAH_WAH_HOO] = "stanley_yah.ogg",
    [CHAR_SOUND_YAWNING] = "jumpman_pause.ogg",
}

local PALETTE_JUMPMAN = {
    [PANTS]  = { r = 0xFF, g = 0x00, b = 0x00 }, --FF0000
    [SHIRT]  = { r = 0x4F, g = 0x5A, b = 0xFF }, --4F5AFF
    [GLOVES] = { r = 0xFF, g = 0xFF, b = 0xFF }, --FFFFFF
    [SHOES]  = { r = 0x00, g = 0x00, b = 0x00 }, --000000
    [HAIR]   = { r = 0x00, g = 0x00, b = 0x00 }, --000000
    [SKIN]   = { r = 0xFE, g = 0xC1, b = 0x79 }, --FEC179
    [CAP]    = { r = 0xFF, g = 0x00, b = 0x00 }, --FF0000
    [EMBLEM] = { r = 0xDC, g = 0x9F, b = 0xFF }  --DC9FFF
}

local PALETTE_JUMPMAN_ALT = {
    [PANTS]  = { r = 0xC0, g = 0x24, b = 0x08 }, --C02408
    [SHIRT]  = { r = 0x37, g = 0x3D, b = 0xE3 }, --373DE3
    [GLOVES] = { r = 0xEB, g = 0xEB, b = 0xFF }, --EBEBFF
    [SHOES]  = { r = 0x00, g = 0x00, b = 0x00 }, --000000
    [HAIR]   = { r = 0x00, g = 0x00, b = 0x00 }, --000000
    [SKIN]   = { r = 0xE9, g = 0x97, b = 0x68 }, --E99768
    [CAP]    = { r = 0xC0, g = 0x24, b = 0x08 }, --C02408
    [EMBLEM] = { r = 0xDC, g = 0x9F, b = 0xFF }  --DC9FFF
}

local PALETTE_JUMPMAN_JP_ARTWORK = {
    [PANTS]  = { r = 0xD0, g = 0x2D, b = 0x32 }, --D02D32
    [SHIRT]  = { r = 0x01, g = 0x86, b = 0xC4 }, --0186C4
    [GLOVES] = { r = 0xED, g = 0xF1, b = 0xF2 }, --EDF1F2
    [SHOES]  = { r = 0x09, g = 0x13, b = 0x0D }, --09130D
    [HAIR]   = { r = 0x09, g = 0x13, b = 0x0D }, --09130D
    [SKIN]   = { r = 0xED, g = 0xF1, b = 0xF2 }, --3DF1F2
    [CAP]    = { r = 0xD0, g = 0x2D, b = 0x32 }, --D02D32
    [EMBLEM] = { r = 0xED, g = 0xF1, b = 0xF2 }  --3DF1F2
}

local PALETTE_JUMPMAN_CLASSIC = {
    [PANTS]  = { r = 0xF8, g = 0x38, b = 0x00 }, --F83800
    [SHIRT]  = { r = 0x00, g = 0x00, b = 0xBF }, --0000BF
    [GLOVES] = { r = 0xF0, g = 0xD0, b = 0xB0 }, --F0D0B0
    [SHOES]  = { r = 0x00, g = 0x00, b = 0xBF }, --0000BF
    [HAIR]   = { r = 0x00, g = 0x00, b = 0xBF }, --0000BF
    [SKIN]   = { r = 0xF0, g = 0xD0, b = 0xB0 }, --F0D0B0
    [CAP]    = { r = 0xF8, g = 0x38, b = 0x00 }, --F83800
    [EMBLEM] = { r = 0xF0, g = 0xD0, b = 0xB0 }  --F0D0B0
}

local PALETTE_STANLEY = {
    [PANTS]  = { r = 0xFF, g = 0xFF, b = 0xFF }, --FFFFFF
    [SHIRT]  = { r = 0x00, g = 0x00, b = 0xFF }, --0000FF
    [GLOVES] = { r = 0xFE, g = 0xC1, b = 0x79 }, --FEC179
    [SHOES]  = { r = 0x72, g = 0x1C, b = 0x0E }, --721C0E
    [HAIR]   = { r = 0x89, g = 0x3E, b = 0x00 }, --893E00
    [SKIN]   = { r = 0xFE, g = 0xC1, b = 0x79 }, --FEC179
    [CAP]    = { r = 0x00, g = 0x00, b = 0xFF }, --0000FF
    [EMBLEM] = { r = 0xFF, g = 0x00, b = 0x00 }  --FF0000
}

local PALETTE_STANLEY_ARCADE = {
    [PANTS]  = { r = 0xCE, g = 0x00, b = 0x00 }, --CE0000
    [SHIRT]  = { r = 0x00, g = 0x00, b = 0xB9 }, --0000B9
    [GLOVES] = { r = 0xFE, g = 0xC1, b = 0x79 }, --FEC179
    [SHOES]  = { r = 0xFF, g = 0x9E, b = 0x00 }, --FF9E00
    [HAIR]   = { r = 0x89, g = 0x3E, b = 0x00 }, --893E00
    [SKIN]   = { r = 0xFE, g = 0xC1, b = 0x79 }, --FEC179
    [CAP]    = { r = 0xCE, g = 0x00, b = 0x00 }, --CE0000
    [EMBLEM] = { r = 0xCE, g = 0x00, b = 0x00 }  --CE0000
}

local PALETTE_STANLEY_SUPER_SPRAYER = {
    [PANTS]  = { r = 0xCE, g = 0x00, b = 0x00 }, --CE0000
    [SHIRT]  = { r = 0xFF, g = 0x9E, b = 0x00 }, --FF9E00
    [GLOVES] = { r = 0xFE, g = 0xC1, b = 0x79 }, --FEC179
    [SHOES]  = { r = 0x52, g = 0x06, b = 0x00 }, --520600
    [HAIR]   = { r = 0x89, g = 0x3E, b = 0x00 }, --893E00
    [SKIN]   = { r = 0xFE, g = 0xC1, b = 0x79 }, --FEC179
    [CAP]    = { r = 0xFF, g = 0x9E, b = 0x00 }, --FF9E00
    [EMBLEM] = { r = 0xCE, g = 0x00, b = 0x00 }  --CE0000
}

local PALETTE_STANLEY_ARTWORKGW = {
    [PANTS]  = { r = 0x00, g = 0x60, b = 0xFF }, --0060FF
    [SHIRT]  = { r = 0xFF, g = 0xA9, b = 0x00 }, --FFA900
    [GLOVES] = { r = 0xFE, g = 0xC1, b = 0x79 }, --FEC179
    [SHOES]  = { r = 0x72, g = 0x1C, b = 0x0E }, --721C0E
    [HAIR]   = { r = 0x89, g = 0x3E, b = 0x00 }, --893E00
    [SKIN]   = { r = 0xFE, g = 0xC1, b = 0x79 }, --FEC179
    [CAP]    = { r = 0xCE, g = 0x00, b = 0x00 }, --CE0000
    [EMBLEM] = { r = 0xCE, g = 0x00, b = 0x00 }  --CE0000
}

local PALETTE_STANLEY_COMMERCIAL = {
    [PANTS]  = { r = 0xE7, g = 0xD2, b = 0xA6 }, --E7D2A6
    [SHIRT]  = { r = 0xB1, g = 0x35, b = 0x50 }, --B13550
    [GLOVES] = { r = 0xFE, g = 0xC1, b = 0x79 }, --FEC179
    [SHOES]  = { r = 0x71, g = 0x4c, b = 0x42 }, --714c42
    [HAIR]   = { r = 0x73, g = 0x06, b = 0x00 }, --730600
    [SKIN]   = { r = 0xFE, g = 0xC1, b = 0x79 }, --FEC179
    [CAP]    = { r = 0xFF, g = 0xFF, b = 0xFF }, --FFFFFF
    [EMBLEM] = { r = 0xFF, g = 0xFF, b = 0xFF }  --FFFFFF
}

local PALETTE_STANLEY_DAI_GYAKUSHU = {
    [PANTS]  = { r = 0xFF, g = 0x00, b = 0x00 }, --FF0000
    [SHIRT]  = { r = 0x00, g = 0x00, b = 0xFF }, --0000FF
    [GLOVES] = { r = 0xFF, g = 0xFF, b = 0x00 }, --FFFF00
    [SHOES]  = { r = 0xFF, g = 0xFF, b = 0x00 }, --FFFF00
    [HAIR]   = { r = 0xFF, g = 0x00, b = 0x00 }, --FF0000
    [SKIN]   = { r = 0xFF, g = 0xFF, b = 0x00 }, --FFFF00
    [CAP]    = { r = 0xFF, g = 0x00, b = 0x00 }, --FF0000
    [EMBLEM] = { r = 0xFF, g = 0x00, b = 0x00 }  --FF0000
}

local CT_JUMPMAN = _G.charSelect.character_add("Jumpman", {"Jumpman is a plumber from New York,", "which first appeared in the videogame 'Donkey Kong'.", "", "One day, a lady called 'Pauline' got kidnapped", "by a monkey called 'Donkey Kong', and he has taken", "her to a dangerous construction site, and now,", "Jumpman has to climb up the dangerous construction", "site to defeat Donkey Kong and rescue her!"}, "AlexXRGames, Brob2nd & TheGreatMario64", { r = 255, g = 0, b = 80 }, E_MODEL_JUMPMAN, CT_MARIO, TEX_JUMPMAN)
local CT_STANLEY = _G.charSelect.character_add("Stanley", {"Stanley, also known as Stanley the Bugman,", "is a bug exterminator who first appeared in the", "Game & Watch game Green House.", "In that game, Stanley uses his", "spray gun to defeat hungry pests.", "He later appeared in the Donkey Kong Arcade franchise", "as the protagonist of the game Donkey Kong 3,", "in which he battles with Donkey Kong and", "several insects in a greenhouse with his spray."}, "BlueKazoo & Brobgonal Second", { r = 0, g = 111, b = 222 }, E_MODEL_STANLEY, CT_MARIO, TEX_STANLEY)

_G.charSelect.character_add_voice(E_MODEL_JUMPMAN, VOICETABLE_JUMPMAN)
_G.charSelect.character_add_voice(E_MODEL_STANLEY, VOICETABLE_STANLEY)
_G.charSelect.character_add_voice(E_MODEL_JUMPMAN_ALT_1, VOICETABLE_JUMPMAN)
_G.charSelect.character_add_voice(E_MODEL_STANLEY_ALT_1, VOICETABLE_STANLEY)
_G.charSelect.character_add_voice(E_MODEL_JUMPMAN_ALT_2, VOICETABLE_JUMPMAN)
_G.charSelect.character_add_voice(E_MODEL_STANLEY_ALT_2, VOICETABLE_STANLEY)
-- Jumpman's Preset Palettes
_G.charSelect.character_add_palette_preset(E_MODEL_JUMPMAN, PALETTE_JUMPMAN)
_G.charSelect.character_add_palette_preset(E_MODEL_JUMPMAN, PALETTE_JUMPMAN_ALT)
_G.charSelect.character_add_palette_preset(E_MODEL_JUMPMAN, PALETTE_JUMPMAN_JP_ARTWORK)
_G.charSelect.character_add_palette_preset(E_MODEL_JUMPMAN, PALETTE_JUMPMAN_CLASSIC)
_G.charSelect.character_add_palette_preset(E_MODEL_JUMPMAN_ALT_1, PALETTE_JUMPMAN_ALT)
_G.charSelect.character_add_palette_preset(E_MODEL_JUMPMAN_ALT_1, PALETTE_JUMPMAN)
_G.charSelect.character_add_palette_preset(E_MODEL_JUMPMAN_ALT_1, PALETTE_JUMPMAN_JP_ARTWORK)
_G.charSelect.character_add_palette_preset(E_MODEL_JUMPMAN_ALT_1, PALETTE_JUMPMAN_CLASSIC)
_G.charSelect.character_add_palette_preset(E_MODEL_JUMPMAN_ALT_2, PALETTE_JUMPMAN_ALT)
_G.charSelect.character_add_palette_preset(E_MODEL_JUMPMAN_ALT_2, PALETTE_JUMPMAN)
_G.charSelect.character_add_palette_preset(E_MODEL_JUMPMAN_ALT_2, PALETTE_JUMPMAN_JP_ARTWORK)
_G.charSelect.character_add_palette_preset(E_MODEL_JUMPMAN_ALT_2, PALETTE_JUMPMAN_CLASSIC)
-- Stanley's Preset Palettes
_G.charSelect.character_add_palette_preset(E_MODEL_STANLEY, PALETTE_STANLEY)
_G.charSelect.character_add_palette_preset(E_MODEL_STANLEY, PALETTE_STANLEY_ARCADE)
_G.charSelect.character_add_palette_preset(E_MODEL_STANLEY, PALETTE_STANLEY_SUPER_SPRAYER)
_G.charSelect.character_add_palette_preset(E_MODEL_STANLEY, PALETTE_STANLEY_COMMERCIAL)
_G.charSelect.character_add_palette_preset(E_MODEL_STANLEY, PALETTE_STANLEY_ARTWORKGW)
_G.charSelect.character_add_palette_preset(E_MODEL_STANLEY, PALETTE_STANLEY_DAI_GYAKUSHU)
_G.charSelect.character_add_palette_preset(E_MODEL_STANLEY_ALT_1, PALETTE_STANLEY)
_G.charSelect.character_add_palette_preset(E_MODEL_STANLEY_ALT_1, PALETTE_STANLEY_ARCADE)
_G.charSelect.character_add_palette_preset(E_MODEL_STANLEY_ALT_1, PALETTE_STANLEY_SUPER_SPRAYER)
_G.charSelect.character_add_palette_preset(E_MODEL_STANLEY_ALT_1, PALETTE_STANLEY_COMMERCIAL)
_G.charSelect.character_add_palette_preset(E_MODEL_STANLEY_ALT_1, PALETTE_STANLEY_ARTWORKGW)
_G.charSelect.character_add_palette_preset(E_MODEL_STANLEY_ALT_1, PALETTE_STANLEY_DAI_GYAKUSHU)
_G.charSelect.character_add_palette_preset(E_MODEL_STANLEY_ALT_2, PALETTE_STANLEY)
_G.charSelect.character_add_palette_preset(E_MODEL_STANLEY_ALT_2, PALETTE_STANLEY_ARCADE)
_G.charSelect.character_add_palette_preset(E_MODEL_STANLEY_ALT_2, PALETTE_STANLEY_SUPER_SPRAYER)
_G.charSelect.character_add_palette_preset(E_MODEL_STANLEY_ALT_2, PALETTE_STANLEY_COMMERCIAL)
_G.charSelect.character_add_palette_preset(E_MODEL_STANLEY_ALT_2, PALETTE_STANLEY_ARTWORKGW)
_G.charSelect.character_add_palette_preset(E_MODEL_STANLEY_ALT_2, PALETTE_STANLEY_DAI_GYAKUSHU)

local voiceTables = {
    [VOICETABLE_JUMPMAN] = true,
    [VOICETABLE_STANLEY] = true
}

--- @param m MarioState
local function mario_update(m)
    if is_player_active(m) == 0 then return end
    local voiceTable = charSelect.character_get_voice(m)
    if voiceTables[voiceTable] then
        return charSelect.voice.snore(m)
    end
end

--- @param m MarioState
--- @param sound CharacterSound
local function character_sound(m, sound)
    local voiceTable = charSelect.character_get_voice(m)
    if voiceTables[voiceTable] then
        return charSelect.voice.sound(m, sound)
    end
end

hook_event(HOOK_MARIO_UPDATE, mario_update)
hook_event(HOOK_CHARACTER_SOUND, character_sound)

if _G.charSelect.credit_add then
    _G.charSelect.credit_add(globalModName, "AlexXRGames", "Jumpman's default model")
    _G.charSelect.credit_add(globalModName, "ThatGurlTilly", "Tilly's Jumpman Pack's creator")
    _G.charSelect.credit_add(globalModName, "BlueKazoo", "Stanley's models")
    _G.charSelect.credit_add(globalModName, "TGM64", "Recolorability/Model/Texture help")
    _G.charSelect.credit_add(globalModName, "Squishy6094", "Added the Alt System")
    _G.charSelect.credit_add(globalModName, "Brobgonal Second", "Recolorability")
    _G.charSelect.credit_add(globalModName, "ER1CK", "Recolorability fixes on Stanley")
end

    -- table of skins
    local SKINTABLE_JUMPMAN = {
        { model = E_MODEL_JUMPMAN_ALT_1,  desc = { "Jumpman is a plumber from New York,", "which first appeared in the videogame 'Donkey Kong'.", "", "One day, a lady called 'Pauline' got kidnapped", "by a monkey called 'Donkey Kong', and he has taken", "her to a dangerous construction site, and now,", "Jumpman has to climb up the dangerous construction", "site to defeat Donkey Kong and rescue her!"}, credit = "ThatGurlTilly",         color = { r = 255, g = 0, b = 80 } },
        { model = E_MODEL_JUMPMAN_ALT_2,  desc = { "Jumpman is a plumber from New York,", "which first appeared in the videogame 'Donkey Kong'.", "", "One day, a lady called 'Pauline' got kidnapped", "by a monkey called 'Donkey Kong', and he has taken", "her to a dangerous construction site, and now,", "Jumpman has to climb up the dangerous construction", "site to defeat Donkey Kong and rescue her!"},  credit = "ThatGurlTilly",         color = { r = 255, g = 0, b = 80 } }
    }

    for index, alt in ipairs(SKINTABLE_JUMPMAN) do
        _G.charSelect.character_add_costume(CT_JUMPMAN, nil, alt.desc, alt.credit, alt.color, alt.model, nil, nil, nil, nil)
end

    -- table of skins
    local SKINTABLE_STANLEY = {
        { model = E_MODEL_STANLEY_ALT_1,  desc = { "Stanley, also known as Stanley the Bugman,", "is a bug exterminator who first appeared in the", "Game & Watch game Green House.", "In that game, Stanley uses his", "spray gun to defeat hungry pests.", "He later appeared in the Donkey Kong Arcade franchise", "as the protagonist of the game Donkey Kong 3,", "in which he battles with Donkey Kong and", "several insects in a greenhouse with his spray." }, credit = "BlueKazoo & Brobgonal Second",        color = { r = 0, g = 111, b = 222 } },
        { model = E_MODEL_STANLEY_ALT_2,  desc = { "Stanley, also known as Stanley the Bugman,", "is a bug exterminator who first appeared in the", "Game & Watch game Green House.", "In that game, Stanley uses his", "spray gun to defeat hungry pests.", "He later appeared in the Donkey Kong Arcade franchise", "as the protagonist of the game Donkey Kong 3,", "in which he battles with Donkey Kong and", "several insects in a greenhouse with his spray." },  credit = "BlueKazoo, Brob2nd & ER1CK",         color = { r = 0, g = 111, b = 222 } }
    }

    for index, alt in ipairs(SKINTABLE_STANLEY) do
        _G.charSelect.character_add_costume(CT_STANLEY, nil, alt.desc, alt.credit, alt.color, alt.model, nil, alt.icon, nil, nil)
    end