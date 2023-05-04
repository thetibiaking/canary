local soulWarFinalBoss = MoveEvent()

function soulWarFinalBoss.onStepIn(creature, item, position, fromPosition)
    local player = creature:getPlayer()
    if not player then
        return true
    end

    if not player:hasAllCurses() then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You must have all 5 curses to enter the final boss room.")
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        player:teleportTo(fromPosition, true)
        return true
    end

    -- Player has all 5 curses, allow them to enter the final boss room
    player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
    return true
end

soulWarFinalBoss:type("stepin")
soulWarFinalBoss:aid(13300)
soulWarFinalBoss:register()
