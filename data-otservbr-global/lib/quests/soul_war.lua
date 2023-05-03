local function applyRandomCurse(player)
    local curses = SoulWar.Curses
    local storedCurse = player:getStorageValue(curses.ClaustrophobicInferno)
    if storedCurse == -1 then
        -- Player does not have a curse stored, select a random curse
        local curseKeys = table.keys(curses)
        local randomIndex = math.random(#curseKeys)
        storedCurse = curses[curseKeys[randomIndex]]
    else
        -- Player already has a curse stored, get the next curse
        local curseIndex = table.find(curses, storedCurse)
        if curseIndex == #curses then
            storedCurse = curses.ClaustrophobicInferno
        else
            storedCurse = curses[table.getn(curses) + 1]
        end
    end
    -- Add the curse to the player's storage
    player:setStorageValue(storedCurse, 1)
	player:getPosition():sendMagicEffect(CONST_ME_POFF)
end