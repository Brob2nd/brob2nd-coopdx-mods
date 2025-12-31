-- name: [CS] DK Arcade Pack
-- description: [CS] DK Arcade Pack v1.21\n\nThis mod adds Jumpman and Stanley from the Donkey Kong arcade videogame\ntrilogy into sm64coopdx!\n\n\\#f54e59\\Credits: \nAlexXRGames, ThaGurlTilly, \n\\#008800\\Squishy6094, AvereySmartGuy,\n\\#5ff54e\\BlueKazoo, ER1CK\n\\#ffffff\\& Brobgonal Second\n\n\\#ffffff\\Requires \\#00ff00\\Character Select \\#ff6868\\enabled!

local TEXT_MOD_NAME = "DK Arcade Pack"

-- Stops mod from loading if Character Select isn't on
if not _G.charSelectExists then
    djui_popup_create("\\#ffffdc\\\n"..TEXT_MOD_NAME.."\nRequires the Character Select Mod\nto use as a Library!\n\nPlease turn on the Character Select Mod and Restart the Room!", 6)
    return 0
end

-- Models
local E_MODEL_JUMPMAN = smlua_model_util_get_id("jumpman_geo")
local E_MODEL_STANLEY = smlua_model_util_get_id("stanley_geo")
local E_MODEL_JUMPMAN_ALT_1 = smlua_model_util_get_id("jumpman_alt_geo")
local E_MODEL_STANLEY_ALT_1 = smlua_model_util_get_id("stanley_alt_geo")
local E_MODEL_JUMPMAN_ALT_2 = smlua_model_util_get_id("jumpman_alt2_geo")
local E_MODEL_STANLEY_ALT_2 = smlua_model_util_get_id("stanley_alt2_geo")

-- Textures
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
    [CHAR_SOUND_LETS_A_GO] = "jumpman_kick.ogg",
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
    [CHAR_SOUND_LETS_A_GO] = "stanley_yahoo.ogg",
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

local PALETTES_JUMPMAN = {
    {
        name = "Default",
        [PANTS]  = "ff0000",
        [SHIRT]  = "4f5aff",
        [GLOVES] = "ffffff",
        [SHOES]  = "000000",
        [HAIR]   = "000000",
        [SKIN]   = "fec179",
        [CAP]    = "ff0000",
        [EMBLEM] = "dc9fff"
    },
    {
        name = "Alternate",
        [PANTS]  = "c02408",
        [SHIRT]  = "373de3",
        [GLOVES] = "ebebff",
        [SHOES]  = "000000",
        [HAIR]   = "000000",
        [SKIN]   = "e99768",
        [CAP]    = "c02408",
        [EMBLEM] = "dc8fff"
    },
    {
       name = "JP Artwork",
       [PANTS]  = "d02d32",
       [SHIRT]  = "0186c4",
       [GLOVES] = "edf1f2",
       [SHOES]  = "09130d",
       [HAIR]   = "09130d",
       [SKIN]   = "edf1f2",
       [CAP]    = "d02d32",
       [EMBLEM] = "edf1f2"
    },
    {
       name = "Arcade",
       [PANTS]  =  "ff0000",
       [SHIRT]  =  "0000aa",
       [GLOVES] =  "ffb855",
       [SHOES]  =  "0000aa",
       [HAIR]   =  "0000aa",
       [SKIN]   =  "ffb855",
       [CAP]    =  "ff0000",
       [EMBLEM] =  "ffb855"
    },
    {
       name = "Atari 2600",
       [PANTS]  =  "c84848",
       [SHIRT]  =  "c84848",
       [GLOVES] =  "c84848",
       [SHOES]  =  "4288b0",
       [HAIR]   =  "000000",
       [SKIN]   =  "ececec",
       [CAP]    =  "c84848",
       [EMBLEM] =  "ececec"
    },
    {
       name = "Atari (8-bit)",
       [PANTS]  =  "641900",
       [SHIRT]  =  "434bff",
       [GLOVES] =  "d3a900",
       [SHOES]  =  "434bff",
       [HAIR]   =  "434bff",
       [SKIN]   =  "d3a900",
       [CAP]    =  "641900",
       [EMBLEM] =  "d3a900"
    },
    {
       name = "C. VIC-20",
       [PANTS]  =  "941701",
       [SHIRT]  =  "941701",
       [GLOVES] =  "e97969",
       [SHOES]  =  "52c6d4",
       [HAIR]   =  "000000",
       [SKIN]   =  "e97969",
       [CAP]    =  "941701",
       [EMBLEM] =  "e97969"
    },
    {
       name = "DOS",
       [PANTS]  =  "a80000",
       [SHIRT]  =  "00a800",
       [GLOVES] =  "a85400",
       [SHOES]  =  "a85400",
       [HAIR]   =  "00a800",
       [SKIN]   =  "a85400",
       [CAP]    =  "a80000",
       [EMBLEM] =  "a85400"
    },
    {
       name = "Apple II",
       [PANTS]  =  "f25e00",
       [SHIRT]  =  "0da1ff",
       [GLOVES] =  "fffffe",
       [SHOES]  =  "fffffe",
       [HAIR]   =  "0da1ff",
       [SKIN]   =  "fffffe",
       [CAP]    =  "f25e00",
       [EMBLEM] =  "fffffe"
    },
    {
       name = "C. 64 (AS)",
       [PANTS]  =  "933a4c",
       [SHIRT]  =  "4f44d8",
       [GLOVES] =  "fbfb8b",
       [SHOES]  =  "4f44d8",
       [HAIR]   =  "4f44d8",
       [SKIN]   =  "fbfb8b",
       [CAP]    =  "933a4c",
       [EMBLEM] =  "fbfb8b"
    },
    {
       name = "C. 64 (OS)",
       [PANTS]  =  "933a4c",
       [SHIRT]  =  "4f44d8",
       [GLOVES] =  "ef839f",
       [SHOES]  =  "4f44d8",
       [HAIR]   =  "4f44d8",
       [SKIN]   =  "ef839f",
       [CAP]    =  "933a4c",
       [EMBLEM] =  "ef839f"
    },
    {
       name = "ColecoVision",
       [PANTS]  =  "933a4c",
       [SHIRT]  =  "1818de",
       [GLOVES] =  "dedede",
       [SHOES]  =  "1818de",
       [HAIR]   =  "1818de",
       [SKIN]   =  "dedede",
       [CAP]    =  "933a4c",
       [EMBLEM] =  "dedede"
    },
    {
       name = "TI-99/4A",
       [PANTS]  =  "f87878",
       [SHIRT]  =  "5050e8",
       [GLOVES] =  "f87878",
       [SHOES]  =  "5050e8",
       [HAIR]   =  "5050e8",
       [SKIN]   =  "f87878",
       [CAP]    =  "f87878",
       [EMBLEM] =  "f87878"
    },
    {
       name = "NES",
       [PANTS]  =  "f83800",
       [SHIRT]  =  "0000bf",
       [GLOVES] =  "f0d0b0",
       [SHOES]  =  "0000bf",
       [HAIR]   =  "0000bf",
       [SKIN]   =  "f0d0B0",
       [CAP]    =  "f83800",
       [EMBLEM] =  "f0d0b0"
    },
    {
       name = "MSX",
       [PANTS]  =  "b02020",
       [SHIRT]  =  "2020f7",
       [GLOVES] =  "b0b0b0",
       [SHOES]  =  "2020f7",
       [HAIR]   =  "2020f7",
       [SKIN]   =  "b0b0b0",
       [CAP]    =  "b02020",
       [EMBLEM] =  "b0b0b0"
    },
    {
       name = "Amstrad CPC",
       [PANTS]  =  "ff0000",
       [SHIRT]  =  "0000ff",
       [GLOVES] =  "ff6666",
       [SHOES]  =  "0000ff",
       [HAIR]   =  "0000ff",
       [SKIN]   =  "ff6666",
       [CAP]    =  "ff0000",
       [EMBLEM] =  "ff6666"
    },
    {
       name = "Atari 7800",
       [PANTS]  =  "e44020",
       [SHIRT]  =  "003876",
       [GLOVES] =  "ffb8ec",
       [SHOES]  =  "003876",
       [HAIR]   =  "003876",
       [SKIN]   =  "ffb8ec",
       [CAP]    =  "e44020",
       [EMBLEM] =  "ffb8ec"
    },
}
local PALETTES_STANLEY = {
    {
       name = "Default",
       [PANTS]  = "ffffff",
       [SHIRT]  = "0000ff",
       [GLOVES] = "ffffff",
       [SHOES]  = "721c0e",
       [HAIR]   = "893e00",
       [SKIN]   = "fec179",
       [CAP]    = "0000ff",
       [EMBLEM] = "ff0000"
   },
   {
       name = "Arcade (SM64)",
       [PANTS]  = "ce0000",
       [SHIRT]  = "0000b9",
       [GLOVES] = "ffffff",
       [SHOES]  = "FF9e00",
       [HAIR]   = "893e00",
       [SKIN]   = "fec179",
       [CAP]    = "ce0000",
       [EMBLEM] = "ce0000"
   },
   {   
       name = "S. Sprayer 64",
       [PANTS]  = "ce0000",
       [SHIRT]  = "ff9e00",
       [GLOVES] = "ffffff",
       [SHOES]  = "520600",
       [HAIR]   = "893e00",
       [SKIN]   = "fec179",
       [CAP]    = "ff9E00",
       [EMBLEM] = "ce0000"
   },
   {
       name = "Game & Watch",
       [PANTS]  = "e7d2a6",
       [SHIRT]  = "b13550",
       [GLOVES] = "ffffff",
       [SHOES]  = "714c42",
       [HAIR]   = "730600",
       [SKIN]   = "fec179",
       [CAP]    = "ffffff",
       [EMBLEM] = "ffffff"
   }, 
   {
       name = "G&W (AD)",
       [PANTS]  = "0060ff",
       [SHIRT]  = "ffa900",
       [GLOVES] = "ffffff",
       [SHOES]  = "721c0e",
       [HAIR]   = "893e00",
       [SKIN]   = "fec179",
       [CAP]    = "ce0000",
       [EMBLEM] = "ce0000"
   },
   {
       name = "Arcade",
       [PANTS]  = "eb0809",
       [SHIRT]  = "020161",
       [GLOVES] = "f69745",
       [SHOES]  = "f6b416",
       [HAIR]   = "640304",
       [SKIN]   = "f69745",
       [CAP]    = "eb0809",
       [EMBLEM] = "eb0809"
   },
   {
       name = "Super Sprayer",
       [PANTS]  = "eb0709",
       [SHIRT]  = "f8d317",
       [GLOVES] = "f69745",
       [SHOES]  = "530105",
       [HAIR]   = "630303",
       [SKIN]   = "f69745",
       [CAP]    = "eb0709",
       [EMBLEM] = "eb0709"
   },
   {
       name = "NES",
       [PANTS]  = "fcfcfc",
       [SHIRT]  = "2038ec",
       [GLOVES] = "fc9838",
       [SHOES]  = "2038ec",
       [HAIR]   = "2038ec",
       [SKIN]   = "fc9838",
       [CAP]    = "fcfcfc",
       [EMBLEM] = "fcfcfc"
   },
   {
       name = "NES (Alt)",
       [PANTS]  = "fff8ff",
       [SHIRT]  = "0088ff",
       [GLOVES] = "ffa04f",
       [SHOES]  = "0088ff",
       [HAIR]   = "0088ff",
       [SKIN]   = "ffa04f",
       [CAP]    = "fff8ff",
       [EMBLEM] = "fff8ff"
   },
   {
       name = "Dai Gyakushu",
       [PANTS]  = "ff0000",
       [SHIRT]  = "0000ff",
       [GLOVES] = "ffff00",
       [SHOES]  = "ffff00",
       [HAIR]   = "ff0000",
       [SKIN]   = "ffff00",
       [CAP]    = "ff0000",
       [EMBLEM] = "ff0000"
   }
}

local CT_JUMPMAN = _G.charSelect.character_add("Jumpman", {"Jumpman is a plumber from New York,", "which first appeared in the videogame 'Donkey Kong'.", "", "One day, a lady called 'Pauline' got kidnapped", "by a monkey called 'Donkey Kong', and he has taken", "her to a dangerous construction site, and now,", "Jumpman has to climb up the dangerous construction", "site to defeat Donkey Kong and rescue her!"}, "AlexXRGames, Brob2nd & TheGreatMario64", { r = 255, g = 0, b = 80 }, E_MODEL_JUMPMAN, CT_MARIO, TEX_JUMPMAN)
local CT_STANLEY = _G.charSelect.character_add("Stanley", {"Stanley, also known as Stanley the Bugman,", "is a bug exterminator who first appeared in the", "Game & Watch game Green House.", "In that game, Stanley uses his", "spray gun to defeat hungry pests.", "He later appeared in the Donkey Kong Arcade franchise", "as the protagonist of the game Donkey Kong 3,", "in which he battles with Donkey Kong and", "several insects in a greenhouse with his spray."}, "BlueKazoo & Brobgonal Second", { r = 0, g = 111, b = 222 }, E_MODEL_STANLEY, CT_MARIO, TEX_STANLEY)

local CSloaded = false
local function on_character_select_load()
-- Jumpman's Preset Palettes.
    for i = 1, #PALETTES_JUMPMAN do
        _G.charSelect.character_add_palette_preset(E_MODEL_JUMPMAN, PALETTES_JUMPMAN[i], PALETTES_JUMPMAN[i].name)
        _G.charSelect.character_add_palette_preset(E_MODEL_JUMPMAN_ALT_1, PALETTES_JUMPMAN[i], PALETTES_JUMPMAN[i].name)
        _G.charSelect.character_add_palette_preset(E_MODEL_JUMPMAN_ALT_2, PALETTES_JUMPMAN[i], PALETTES_JUMPMAN[i].name)
    end
-- Stanley's Preset Palettes.
    for i = 1, #PALETTES_STANLEY do
    _G.charSelect.character_add_palette_preset(E_MODEL_STANLEY, PALETTES_STANLEY[i], PALETTES_STANLEY[i].name)
    _G.charSelect.character_add_palette_preset(E_MODEL_STANLEY_ALT_1, PALETTES_STANLEY[i], PALETTES_STANLEY[i].name)
    _G.charSelect.character_add_palette_preset(E_MODEL_STANLEY_ALT_2, PALETTES_STANLEY[i], PALETTES_STANLEY[i].name)
    end
-- Character's Voices.
    _G.charSelect.character_add_voice(E_MODEL_JUMPMAN, VOICETABLE_JUMPMAN)
    _G.charSelect.character_add_voice(E_MODEL_STANLEY, VOICETABLE_STANLEY)
    _G.charSelect.character_add_voice(E_MODEL_JUMPMAN_ALT_1, VOICETABLE_JUMPMAN)
    _G.charSelect.character_add_voice(E_MODEL_STANLEY_ALT_1, VOICETABLE_STANLEY)
    _G.charSelect.character_add_voice(E_MODEL_JUMPMAN_ALT_2, VOICETABLE_JUMPMAN)
    _G.charSelect.character_add_voice(E_MODEL_STANLEY_ALT_2, VOICETABLE_STANLEY)
-- Character Categorys.
    _G.charSelect.character_set_category(CT_JUMPMAN, "DK Arcade")
    _G.charSelect.character_set_category(CT_STANLEY, "DK Arcade")
-- Mod Credits.
    _G.charSelect.credit_add(TEXT_MOD_NAME, "AlexXRGames", "Jumpman's model")
    _G.charSelect.credit_add(TEXT_MOD_NAME, "ThatGurlTilly", "Tilly's Jumpman Pack")
    _G.charSelect.credit_add(TEXT_MOD_NAME, "BlueKazoo", "Stanley's models")
    _G.charSelect.credit_add(TEXT_MOD_NAME, "AvereySmartGuy", "Revamped Model")
    _G.charSelect.credit_add(TEXT_MOD_NAME, "Squishy6094", "Added Alt System")
    _G.charSelect.credit_add(TEXT_MOD_NAME, "Brobgonal Second", "Recolorability")
    _G.charSelect.credit_add(TEXT_MOD_NAME, "ER1CK", "Recolorability fixes")

    CSloaded = true
end

local function on_character_sound(m, sound)
    if not CSloaded then return end
    if _G.charSelect.character_get_voice(m) == VOICETABLE_JUMPMAN then return _G.charSelect.voice.sound(m, sound) end
    if _G.charSelect.character_get_voice(m) == VOICETABLE_STANLEY then return _G.charSelect.voice.sound(m, sound) end
end

local function on_character_snore(m)
    if not CSloaded then return end
    if _G.charSelect.character_get_voice(m) == VOICETABLE_JUMPMAN then return _G.charSelect.voice.snore(m) end
    if _G.charSelect.character_get_voice(m) == VOICETABLE_STANLEY then return _G.charSelect.voice.snore(m) end
end

-- Table of Skins.
local SKINTABLE_JUMPMAN = {
    { model = E_MODEL_JUMPMAN_ALT_1,  desc = { "Jumpman is a plumber from New York,", "which first appeared in the videogame 'Donkey Kong'.", "", "One day, a lady called 'Pauline' got kidnapped", "by a monkey called 'Donkey Kong', and he has taken", "her to a dangerous construction site, and now,", "Jumpman has to climb up the dangerous construction", "site to defeat Donkey Kong and rescue her!"}, credit = "ThatGurlTilly",         color = { r = 255, g = 0, b = 80 } },
        { model = E_MODEL_JUMPMAN_ALT_2,  desc = { "Jumpman is a plumber from New York,", "which first appeared in the videogame 'Donkey Kong'.", "", "One day, a lady called 'Pauline' got kidnapped", "by a monkey called 'Donkey Kong', and he has taken", "her to a dangerous construction site, and now,", "Jumpman has to climb up the dangerous construction", "site to defeat Donkey Kong and rescue her!"},  credit = "ThatGurlTilly",         color = { r = 255, g = 0, b = 80 } }
}

for index, alt in ipairs(SKINTABLE_JUMPMAN) do
    _G.charSelect.character_add_costume(CT_JUMPMAN, nil, alt.desc, alt.credit, alt.color, alt.model, nil, nil, nil, nil)
end

-- Table of Skins.
local SKINTABLE_STANLEY = {
    { model = E_MODEL_STANLEY_ALT_1,  desc = { "Stanley, also known as Stanley the Bugman,", "is a bug exterminator who first appeared in the", "Game & Watch game Green House.", "In that game, Stanley uses his", "spray gun to defeat hungry pests.", "He later appeared in the Donkey Kong Arcade franchise", "as the protagonist of the game Donkey Kong 3,", "in which he battles with Donkey Kong and", "several insects in a greenhouse with his spray." }, credit = "BlueKazoo & Brobgonal Second",        color = { r = 0, g = 111, b = 222 } },
    { model = E_MODEL_STANLEY_ALT_2,  desc = { "Stanley, also known as Stanley the Bugman,", "is a bug exterminator who first appeared in the", "Game & Watch game Green House.", "In that game, Stanley uses his", "spray gun to defeat hungry pests.", "He later appeared in the Donkey Kong Arcade franchise", "as the protagonist of the game Donkey Kong 3,", "in which he battles with Donkey Kong and", "several insects in a greenhouse with his spray." },  credit = "BlueKazoo, Brob2nd & ER1CK",         color = { r = 0, g = 111, b = 222 } }
}

for index, alt in ipairs(SKINTABLE_STANLEY) do
    _G.charSelect.character_add_costume(CT_STANLEY, nil, alt.desc, alt.credit, alt.color, alt.model, nil, alt.icon, nil, nil)
end

hook_event(HOOK_ON_MODS_LOADED, on_character_select_load)
hook_event(HOOK_CHARACTER_SOUND, on_character_sound)
hook_event(HOOK_MARIO_UPDATE, on_character_snore)