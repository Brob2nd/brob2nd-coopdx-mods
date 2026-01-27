-- Custom Geo Functions --

--- @param m MarioState
--- @return integer
--- Returns from directions between 1-8 depending on the camera angle
function mario_yaw_from_camera(m)
    local l = gLakituState
    local tau = math.pi * 2

    local vector = {X = l.pos.x - m.pos.x, Y = l.pos.y - m.pos.y,  Z = l.pos.z - m.pos.z}
    local r0 = math.rad((m.faceAngle.y * 360) / 0x10000)
    local r1 = r0 < 0 and tau - math.abs(r0) or r0
    local a0 = math.atan(vector.Z, vector.X) + math.pi * 0.5

    local a1
    a1 = ((a0 < 0 and tau - math.abs(a0) or a0) + r1)

    local a2 = (a1 % tau) * 8 / tau
    local angle = (math.round(a2) % 8) + 1
    return angle
end