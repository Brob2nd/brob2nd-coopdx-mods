if not _G.charSelectExists then return end

ANGLE_QUEUE_SIZE = 9
SPIN_TIMER_SUCCESSFUL_INPUT = 4

gEventTable = {}
gCharSelectEventTable = {}

gStateExtras = {}
for i = 0, (MAX_PLAYERS - 1) do
    gStateExtras[i] = {}
    local m = gMarioStates[i]
    local e = gStateExtras[i]
    e.prevPos = {}
    e.prevPos.x = 0
    e.prevPos.y = 0
    e.prevPos.z = 0
    e.angleDeltaQueue = {}
    for j = 0, (ANGLE_QUEUE_SIZE - 1) do e.angleDeltaQueue[j] = 0 end
    e.lastAction = m.action
    e.animFrame = 0
    e.animArg = 0
    e.scuttle = 0
    e.averageForwardVel = 0
    e.boostTimer = 0
    e.rotAngle = 0
    e.lastHurtCounter = 0
    e.stickLastAngle = 0
    e.spinDirection = 0
    e.spinBufferTimer = 0
    e.spinInput = 0
    e.lastIntendedMag = 0
    e.swims = 0
    -- birdo
    e.spitTimer = 0
    e.framesSinceShoot = 255
    e.flameCharge = 0
end

-------------------
-- Boshi Flutter --
-------------------

-- Flutterable actions, these don't match the DS flutterable actions, they also include as many act/jump related stuff as possible that can be done and isn't buggy.
local flutterWhiteList = {
    [ACT_JUMP] = true,
    [ACT_DOUBLE_JUMP] = true,
    [ACT_TRIPLE_JUMP] = true,
    [ACT_LONG_JUMP] = true,
    [ACT_FREEFALL] = true,
    [ACT_BACKFLIP] = true,
    [ACT_SIDE_FLIP] = true,
    [ACT_WALL_KICK_AIR] = true,
    [ACT_STEEP_JUMP] = true,
    [ACT_WATER_JUMP] = true,
    [ACT_TOP_OF_POLE_JUMP] = true
}

ACT_FLUTTER = allocate_mario_action(ACT_FLAG_AIR | ACT_FLAG_ALLOW_VERTICAL_WIND_ACTION | ACT_GROUP_AIRBORNE)
BOSHI_ANIM_FLUTTER = 'boshi_flutter_jump_em'
local BOSHI_SOUND_FLUTTER = audio_sample_load("boshi_flutter.ogg") -- Load audio sample

---@param m MarioState
function act_flutter(m)

    -- End flutter after 1.1 seconds
    if m.actionTimer >= 33 or (m.input & INPUT_A_DOWN) == 0 then
        if m.actionTimer < 33 then
            audio_sample_stop(BOSHI_SOUND_FLUTTER) -- Stop sample after letting go of A
        end
        return set_mario_action(m, ACT_FREEFALL, 0)
    end

    local ended = common_air_action_step(m, ACT_JUMP_LAND, CHAR_ANIM_RUNNING_UNUSED, 0) ~= 0 -- Checks if the action ended earlier due to forced actions like bonking or landing

    if ended then
        audio_sample_stop(BOSHI_SOUND_FLUTTER) -- Stop sample after landing
    end

    if m.actionTimer == 0 and not ended then
        audio_sample_play(BOSHI_SOUND_FLUTTER, m.pos, 1) -- Play audio sample
    end

    smlua_anim_util_set_animation(m.marioObj, BOSHI_ANIM_FLUTTER) -- Sets the animation

    m.marioBodyState.eyeState = MARIO_EYES_CLOSED ---@type MarioEyesGSCId Eye State
    m.vel.y = approach_f32(m.vel.y, m.actionTimer / 1.5, 6, 6) -- Height increases faster as the 1.1 seconds passes
    m.marioObj.header.gfx.animInfo.animAccel = 32768 * 3 -- Animation Speed

    m.actionTimer = m.actionTimer + 1
    return false
end

function boshi_before_phys_step(m)
    local e = gStateExtras[m.playerIndex]

    local hScale = 1.0
    local vScale = 1.0

    -- slower ground movement
    if (m.action & ACT_FLAG_MOVING) ~= 0 then
        hScale = hScale * 0.95
    end

    -- faster holding item
    if m.heldObj ~= nil then
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
    if (m.prevAction & ACT_FLAG_AIR == 0 or m.action == ACT_WALL_KICK_AIR) and m.action & ACT_FLAG_AIR ~= 0 and flutterWhiteList[m.action] and m.controller.buttonDown & A_BUTTON ~= 0 and m.vel.y < 0 then
        set_mario_action(m, ACT_FLUTTER, 0)
    end
    -- Ground Pound Cancel
    if m.action == ACT_GROUND_POUND and m.input & INPUT_B_PRESSED ~= 0 then
        m.forwardVel = 36
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

hook_mario_action(ACT_FLUTTER, { every_frame = act_flutter })

function boshi_on_set_action(m)
    local e = gStateExtras[m.playerIndex]

    -- wall kick height based on how fast boshi is going
    if m.action == ACT_WALL_KICK_AIR and m.prevAction ~= ACT_HOLDING_POLE and m.prevAction ~= ACT_CLIMBING_POLE then
        m.vel.y = m.vel.y * 0.95
        m.vel.y = m.vel.y + e.averageForwardVel * 0.95
        return
    end
        -- less height on jumps
        if m.action == ACT_JUMP or m.action == ACT_DOUBLE_JUMP or m.action == ACT_TRIPLE_JUMP or m.action == ACT_SPECIAL_TRIPLE_JUMP or m.action == ACT_STEEP_JUMP or m.action == ACT_RIDING_SHELL_JUMP or m.action == ACT_BACKFLIP or m.action == ACT_WALL_KICK_AIR or m.action == ACT_LONG_JUMP or m.action == ACT_TOP_OF_POLE_JUMP or m.action == ACT_BURNING_JUMP or m.action == ACT_WATER_JUMP or m.action == ACT_THROWN_FORWARD then
            m.vel.y = m.vel.y * 0.95
    
            -- prevent from getting stuck on platform
            if m.marioObj.platform ~= nil then
                m.pos.y = m.pos.y + 10
            end
        elseif m.action == ACT_SIDE_FLIP then
            m.vel.y = m.vel.y * 0.95
    
            -- prevent from getting stuck on platform
            if m.marioObj.platform ~= nil then
                m.pos.y = m.pos.y + 10
            end
        end
    
        e.lastAction = action
    end

-------------
---  Main  --
-------------

local function on_character_select_load()
    local CT_BOSHI     = csBoshiem[1].tablePos

    -- Boshi
    _G.charSelect.character_hook_moveset(CT_BOSHI, HOOK_MARIO_UPDATE, boshi_update)
    _G.charSelect.character_hook_moveset(CT_BOSHI, HOOK_BEFORE_PHYS_STEP, boshi_before_phys_step)
    _G.charSelect.character_hook_moveset(CT_BOSHI, HOOK_ON_SET_MARIO_ACTION, boshi_on_set_action)
end

hook_event(HOOK_ON_MODS_LOADED, on_character_select_load)
