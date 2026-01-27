--- Vars that all movesets use --

--- @type CharacterState[]
gCharacterStates = {}
for i = 0, (MAX_PLAYERS - 1) do
    gCharacterStates[i] = {}
    local m = gMarioStates[i]
    local e = gCharacterStates[i]

    e.boshi      = {}

    e.boshi.averageForwardVel = 0
end
