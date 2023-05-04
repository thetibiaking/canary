local soulWarFinalBoss = MoveEvent()

function soulWarFinalBoss.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

    

	player:teleportTo(fromPosition, true)
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	return true
end

soulWarFinalBoss:type("stepin")
soulWarFinalBoss:aid(12100)
soulWarFinalBoss:register()
