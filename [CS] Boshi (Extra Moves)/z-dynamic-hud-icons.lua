if not dynamicHudAPI then return end

function setup_recolor_icons()
    local FEATURE = dynamicHudAPI.FEATURE
    local NONE = dynamicHudAPI.NONE
    dynamicHudAPI.add_head_for_cs(CT_BOSHI, nil, get_texture_info("recolor_icon_boshi"),
        { GLOVES, HAIR, CAP, FEATURE, NONE, NONE},
        { GLOVES, HAIR, CAP, FEATURE, NONE, FEATURE}
    )
end

hook_event(HOOK_ON_MODS_LOADED, setup_recolor_icons)