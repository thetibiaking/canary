function Player.applyRandomCurse(self)
    local curses = SoulWar.Curses
    local storedCurse = self:getStorageValue(curses.ClaustrophobicInferno)
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
    self:setStorageValue(storedCurse, 1)
	self:getPosition():sendMagicEffect(CONST_ME_POFF)
end

function Player.resetCurses(self)
    local curses = SoulWar.Curses
    for _, curseId in pairs(curses) do
        self:setStorageValue(curseId, -1)
    end
end

function Player.getCurses(self)
    local curseList = {}
    for curseName, curseId in pairs(SoulWarLib.Curses) do
        if self:getStorageValue(curseId) == 1 then
            table.insert(curseList, curseName)
        end
    end
    return curseList
end

function Player.hasKilledMegalomania(self)
    resetCurses()
end

