-------------------
-- Boshi Moveset --
-------------------

if not charSelect then return end

-- Flutterable actions, these don't match the DS flutterable actions, , these also include as many act/jump related stuff as possible that can be done and isn't buggy.
local flutterActs = {
    [ACT_JUMP]             = true,
    [ACT_DOUBLE_JUMP]      = true,
    [ACT_TRIPLE_JUMP]      = true,
    [ACT_LONG_JUMP]        = true,
    [ACT_FREEFALL]         = true,
    [ACT_BACKFLIP]         = true,
    [ACT_SIDE_FLIP]        = true,
    [ACT_WALL_KICK_AIR]    = true,
    [ACT_STEEP_JUMP]       = true,
    [ACT_WATER_JUMP]       = true,
    [ACT_TOP_OF_POLE_JUMP] = true
}

_G.ACT_FLUTTER = allocate_mario_action(ACT_FLAG_AIR | ACT_FLAG_ALLOW_VERTICAL_WIND_ACTION | ACT_GROUP_AIRBORNE)
BOSHI_ANIM_FLUTTER = 'boshi_flutter_jump_em'

---@param m MarioState
function act_flutter(m)
    -- End flutter after 1.1 seconds
    if m.actionTimer >= 33 or (m.input & INPUT_A_DOWN) == 0 then
        if m.actionTimer < 33 then
            play_character_sound(m, CHAR_SOUND_MAX) -- Stop sample after letting go of A
        end
        return set_mario_action(m, ACT_FREEFALL, 0)
    end

    local ended = common_air_action_step(m, ACT_JUMP_LAND, CHAR_ANIM_RUNNING_UNUSED, 0) ~= 0 -- Checks if the action ended earlier due to forced actions like bonking or landing

    if ended then
        play_character_sound(m, CHAR_SOUND_MAX) -- Stop sample after landing
    elseif m.actionTimer == 0 then
        play_character_sound(m, BOSHI_SOUND_FLUTTER) -- Play audio sample
    end

    smlua_anim_util_set_animation(m.marioObj, BOSHI_ANIM_FLUTTER) -- Sets the animation

    m.marioBodyState.eyeState = MARIO_EYES_CLOSED                 -- Eye State
    m.vel.y = approach_f32(m.vel.y, m.actionTimer / 1.5, 6, 6)   -- Height increases faster as the 1 second passes
    m.marioObj.header.gfx.animInfo.animAccel = 32768 * 3        -- Anim Speed

    m.actionTimer = m.actionTimer + 1
    return false
end

function boshi_before_phys_step(m)
    local hScale = 1.0
    local vScale = 1.0

    -- slower ground movement
    if (m.action & ACT_FLAG_MOVING) ~= 0 then
        hScale = hScale * 0.95
    end

    -- faster holding item
    if m.heldObj then
        m.vel.y = m.vel.y - 1.5
        hScale = hScale * 1.1
        if (m.action & ACT_FLAG_AIR) ~= 0 then
            hScale = hScale * 1.1
        end
    end

    m.vel.x = m.vel.x * hScale
    m.vel.y = m.vel.y * vScale
    m.vel.z = m.vel.z * hScale
end

---@param m MarioState
function boshi_update(m)
    if m.prevAction & ACT_FLAG_AIR == 0 and m.action & ACT_FLAG_AIR ~= 0 and flutterActs[m.action] and m.controller.buttonDown & A_BUTTON ~= 0 and m.vel.y < 0 then
        set_mario_action(m, ACT_FLUTTER, 0)
    end
    -- Ground Pound Cancel
    if m.action == ACT_GROUND_POUND and m.input & INPUT_B_PRESSED ~= 0 then
        m.forwardVel = 33
        m.faceAngle.y = m.intendedYaw
        m.vel.y = 12
        set_mario_action(m, ACT_DIVE, 0)
        m.particleFlags = m.particleFlags | PARTICLE_DUST
    end
    -- Ground Pound Jump
    if m.action == ACT_GROUND_POUND_LAND and (m.input & INPUT_A_PRESSED) ~= 0 then
        set_mario_action(m, ACT_TRIPLE_JUMP, 0)
        m.vel.y = m.vel.y - 4
    end
end

function boshi_on_set_action(m)
    local e = gCharacterStates[m.playerIndex]

    -- wall kick height based on how fast boshi is going
    if m.action == ACT_WALL_KICK_AIR and m.prevAction ~= ACT_HOLDING_POLE and m.prevAction ~= ACT_CLIMBING_POLE then
        m.vel.y = m.vel.y * 0.95
        m.vel.y = m.vel.y + e.boshi.averageForwardVel * 0.95
        return
    end

    -- less height on jumps
    if m.action == ACT_JUMP or m.action == ACT_DOUBLE_JUMP or m.action == ACT_TRIPLE_JUMP or m.action == ACT_SPECIAL_TRIPLE_JUMP or m.action == ACT_STEEP_JUMP or m.action == ACT_RIDING_SHELL_JUMP or m.action == ACT_BACKFLIP or m.action == ACT_WALL_KICK_AIR or m.action == ACT_LONG_JUMP or m.action == ACT_TOP_OF_POLE_JUMP or m.action == ACT_BURNING_JUMP or m.action == ACT_WATER_JUMP or m.action == ACT_THROWN_FORWARD then
            m.vel.y = m.vel.y * 0.95
        m.vel.y = m.vel.y * 0.95

        -- prevent from getting stuck on platform
        if m.marioObj.platform then
            m.pos.y = m.pos.y + 10
        end
    elseif m.action == ACT_SIDE_FLIP then
        m.vel.y = m.vel.y * 0.95

        -- prevent from getting stuck on platform
        if m.marioObj.platform then
            m.pos.y = m.pos.y + 10
        end
    end
end

hook_mario_action(ACT_FLUTTER, act_flutter)