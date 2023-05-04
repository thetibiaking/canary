function onKill(cid, target)
    local targetName = Monster(target):getName()
    if targetName == "Megalomania" then
        local player = Player(cid)
        player:removeRandomCurses(targetName)
    end
end