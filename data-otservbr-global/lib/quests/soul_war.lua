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

function Player.removeRandomCurses(self, bossName)
    -- Verify if the boss that was killed matches the expected boss name
    if bossName ~= "Megalomania" then
        return -- do nothing if the boss name doesn't match
    end

    -- Get a list of curses the player currently has
    local cursesList = self:getCurses()

    -- If the player has less than 2 curses, just remove all curses instead
    if #cursesList < 2 then
        self:resetCurses()
        return
    end

    -- Shuffle the curses list
    for i = #cursesList, 2, -1 do
        local j = math.random(i)
        cursesList[i], cursesList[j] = cursesList[j], cursesList[i]
    end

    -- Remove the first two curses in the shuffled list
    self:removeCurse(SoulWar.Curses[cursesList[1]])
    self:removeCurse(SoulWar.Curses[cursesList[2]])
end

function Player.removeCurses(self)
    local curses = SoulWar.Curses
    for curseName, curseId in pairs(curses) do
        if curseId == curses.EbbandFlow or curseId == curses.RottenWasteland then
            self:setStorageValue(curseId, -1)
            self:getPosition():sendMagicEffect(CONST_ME_POFF)
        end
    end
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

function Player.hasAllCurses(self)
    local curses = SoulWar.Curses
    for _, curseId in pairs(curses) do
        if self:getStorageValue(curseId) ~= 1 then
            return false
        end
    end
    return true
end

function Player:hasKilledMegalomania(self)
    self:resetCurses()
    self:removeRandomCurses()
end

