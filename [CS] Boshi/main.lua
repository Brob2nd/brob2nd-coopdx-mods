-- name: [CS] \\#0066FF\\Boshi
-- description:[CS] \\#0066FF\\Boshi\n\n\\#FFFFFF\\This mod adds \\#0066FF\\Boshi \\#FFFFFF\\from \nSuper Mario RPG: Legend of the\nSeven Stars into sm64coopdx!\n\ \n\\\#00ff00\\It is RECOMMENDED to have the interpolation set to ACCURATE.\n\ \n\Delete the modcache file in sm64coopdx's roaming file and restart if multiplayer causes issues.\n\ \n\\\#ff0000\\This Pack requires\n\Character Select v1.16 or newer.
-- category: cs

local TEXT_PACK_NAME = "Boshi"
if not charSelect then
    djui_popup_create(
    "\\#ffffa0\\Extra Characters requires\nCharacter Select to be enabled.\n\nPlease rehost with it enabled.", 4)
    return
end


-- Additional Voicelines used for Characters
BOSHI_SOUND_FLUTTER = CHAR_SOUND_MAX + 1

Boshi = {
    -----------
    -- Boshi --
    -----------
    {
        name = "Boshi",
        description =
        "A lone Blue Yoshi who really loves eating Yoshi Cookies and has a deeper voice than most other Yoshi's, he's also Yoshi's rival! He may seem tough on the outside with his studded collar and mirrored shades, but he has a weakness for cookies that may unsaddle him in the end.",
        credits = "BlueKazoo, Brob2nd & WBmarioo / VA: FunkyLion",
        color = { r = 0, g = 102, b = 255 },
        model = smlua_model_util_get_id("boshi_geo"),
        forceChar = CT_MARIO,
        lifeIcon = get_texture_info("icon-boshi"),
        camScale = 1.1,
        offset = 0,
        meter = {
            label = {
                left = get_texture_info("char-select-boshi-meter-left"),
                right = get_texture_info("char-select-boshi-meter-right"),
            },
            pie = {
                [1] = get_texture_info("char_select_custom_meter_pie1"),
                [2] = get_texture_info("char_select_custom_meter_pie2"),
                [3] = get_texture_info("char_select_custom_meter_pie3"),
                [4] = get_texture_info("char_select_custom_meter_pie4"),
                [5] = get_texture_info("char_select_custom_meter_pie5"),
                [6] = get_texture_info("char_select_custom_meter_pie6"),
                [7] = get_texture_info("char_select_custom_meter_pie7"),
                [8] = get_texture_info("char_select_custom_meter_pie8"),
            }
        },
        caps = {
            normal = smlua_model_util_get_id("boshi_cap_geo"),
            wing = smlua_model_util_get_id("boshi_wing_cap_geo"),
            metal = smlua_model_util_get_id("boshi_metal_cap_geo"),
            metalWing = smlua_model_util_get_id("boshi_metal_wing_cap_geo")
        },
        palettes = {
            {
                name     = "Default",
                [PANTS]  = { r = 0x89, g = 0x00, b = 0x0F },
                [SHIRT]  = { r = 0x00, g = 0x66, b = 0xFF },
                [GLOVES] = { r = 0xFF, g = 0xFF, b = 0xFF },
                [SHOES]  = { r = 0x89, g = 0x00, b = 0x0F },
                [HAIR]   = { r = 0xFF, g = 0x66, b = 0x00 },
                [SKIN]   = { r = 0x89, g = 0x00, b = 0x0F },
                [CAP]    = { r = 0x00, g = 0x66, b = 0xFF },
                [EMBLEM] = { r = 0xFF, g = 0x00, b = 0x00 },
            },
            {
                name     = "Retro",
                [PANTS]  = "900010",
                [SHIRT]  = "6080f8",
                [GLOVES] = "f8f8f8",
                [SHOES]  = "b80818",
                [HAIR]   = "e06000",
                [SKIN]   = "b80818",
                [CAP]    = "6080f8",
                [EMBLEM] = "900010",
            },
            {
                name     = "Toy",
                [PANTS]  = "fa951e",
                [SHIRT]  = "1833d8",
                [GLOVES] = "9e5b21",
                [SHOES]  = "46130f",
                [HAIR]   = "ce3c06",
                [SKIN]   = "da951e",
                [CAP]    = "1833d8",
                [EMBLEM] = "da951e",
            },
            {
                name     = "Cloud",
                [SHIRT]  = "ffffb0",
                [PANTS]  = "68401b",
                [GLOVES] = "ffffff",
                [SHOES]  = "e86ac2",
                [HAIR]   = "e86ac2",
                [SKIN]   = "c2885c",
                [CAP]    = "ffffb0",
                [EMBLEM] = "24e0f1",
            },
            {
                name     = "Bandit",
                [SHIRT]  = "432475",
                [PANTS]  = "ff6a00",
                [GLOVES] = "93b876",
                [SHOES]  = "ff3000",
                [HAIR]   = "93c876",
                [SKIN]   = "ff3600",
                [CAP]    = "432475",
                [EMBLEM] = "ff3000",
            },
            {
                name     = "Dragon",
                [PANTS]  = '00d000',
                [SHIRT]  = 'c00000',
                [GLOVES] = 'c0c0c0',
                [SHOES]  = '00d000',
                [HAIR]   = '00d000',
                [SKIN]   = 'ffce39',
                [CAP]    = 'ff0000',
                [EMBLEM] = '00c000'
            },
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
            [CHAR_SOUND_SNORING3] = { "boshi_snoring2.ogg", "boshi_snoring1.ogg", "boshi_snoring3.ogg" },
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
            [CHAR_SOUND_YAH_WAH_HOO] = { "boshi_yah_wah_hoo1.ogg", "boshi_yah_wah_hoo2.ogg", "boshi_yah_wah_hoo3.ogg" },
            [CHAR_SOUND_HELLO] = "boshi_hello.ogg",
            -- Non-vanilla lines
            [BOSHI_SOUND_FLUTTER] = "boshi_flutter.ogg",
        },
        anims = {
            [CS_ANIM_MENU] = "cs_boshi",
        }
    },
}

local BoshiCredits = {
    {
        name = TEXT_PACK_NAME,
        "Brob2nd,Lead Dev",
        "Sharen,Animation",
        "Squishy6094,CS Coder",
        "FunkyLion,Voice Actor",
        '"Oreo" & JillyJane,Render Icons',
        'EmilyEmmi,Dynamic HUD Icons'

    },
    {
        name = TEXT_PACK_NAME .. " Model",
        "BlueKazoo,Original Model",
        "WBmario,Model Decomp/Revamp",
        "Brob2nd,Recolorability",
        "ER1CK,Recolorability",
    },
    {
        name = TEXT_PACK_NAME .. " Moveset",
        "xLuigiGamerx,Moveset, Coder",
        "Brob2nd,Modified Moveset",
        "Baconator2558,Tweaks and Help",
    },
}

local function on_character_select_load()
    for i, char in pairs(Boshi) do
        local _ENV = setmetatable(char, { __index = _G })
        tablePos = character_add(name, description, credits, color, model, forceChar, lifeIcon, camScale, offset, meter, graffiti)
        if caps then character_add_caps(model, caps) end
        if voices then character_add_voice(model, voices) end
        -- if costumes then character_add_costume(model, costumes) end
        if palettes then
            for i = 1, #palettes do
                character_add_palette_preset(model, palettes[i], palettes[i].name)
            end
        end
        if anims then character_add_animations(model, anims, eyes, hands) end
        if meter then character_add_health_meter(tablePos, meter) end
        if graffiti then character_add_graffiti(tablePos, graffiti) end
    end
    for i = 1, #BoshiCredits do
        for c = 1, #BoshiCredits[i] do
            local creditSplit = string.split(BoshiCredits[i][c], ",")
            charSelect.credit_add(BoshiCredits[i].name, creditSplit[1], creditSplit[2])
        end
    end
end

hook_event(HOOK_ON_MODS_LOADED, on_character_select_load)