local internalNpcName = "Gnomcruiter"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 160,
	lookHead = 58,
	lookBody = 119,
	lookLegs = 81,
	lookFeet = 114
}

npcConfig.flags = {
	floorchange = false
}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)

npcType.onThink = function(npc, interval)
	npcHandler:onThink(npc, interval)
end

npcType.onAppear = function(npc, creature)
	npcHandler:onAppear(npc, creature)
end

npcType.onDisappear = function(npc, creature)
	npcHandler:onDisappear(npc, creature)
end

npcType.onMove = function(npc, creature, fromPosition, toPosition)
	npcHandler:onMove(npc, creature, fromPosition, toPosition)
end

npcType.onSay = function(npc, creature, type, message)
	npcHandler:onSay(npc, creature, type, message)
end

npcType.onCloseChannel = function(npc, creature)
	npcHandler:onCloseChannel(npc, creature)
end

local function creatureSayCallback(npc, creature, type, message)
	local player = Player(creature)
	local playerId = player:getId()

	if not npcHandler:checkInteraction(npc, creature) then
		return false
	end

	if MsgContains(message, "Talented") then
		if player:getStorageValue(Storage.PrimalOrdealQuest.Gnomcruiter) < 1 then
			npcHandler:say("Are you interested in joining the efforts of the gnomish expedition corps?", npc, creature)
			npcHandler:setTopic(playerId, 1)
		elseif player:getStorageValue(Storage.PrimalOrdealQuest.Gnomcruiter) == 1 then
			npcHandler:say("You already started the mission", npc, creature)
			npcHandler:setTopic(playerId, 0)
		end
	elseif MsgContains(message, "yes") then
		if npcHandler:getTopic(playerId) == 1 then
			player:setStorageValue(Storage.PrimalOrdealQuest.Gnomcruiter, 1)
			npcHandler:say(" So listen, our prospectors recently discovered a marvelous new place deep under the surface of the world ...\n It is a whole landmass illuminated by a strange mist that hungs over it. ...\n: It's populated by all kinds of primordeal creatures. ...\n: Some are probably the progenitors of creatures that we currently know, whereas other creatues have never been seen before. ...\n: In a joint venture with the adventurers guild we try to unearth the area's treasures and even discovered the ramains of a mysterious civilisation that has become extinct long ago. ...\n: Our greatest accomplishment yet was the discovery of the so called exaltation forge. ...\n: Our gnomish scientists made the thing work and the adventurers' guild transported it to one of their bases. ...\n: And we can only guess what other discoveries await us. ...\n: As of now though, our operation has run into problems. That's where you come into play. ...\n: We are looking for experienced people that want to join our efforts.", npc, creature)
			npcHandler:setTopic(playerId, 2)
		end
	end
	elseif MsgContains(message, "join") then
		if npcHandler:getTopic(playerId) == 2 then
			player:setStorageValue(Storage.PrimalOrdealQuest.GnompronaAcess, 1)
			npcHandler:say(" Great! Consider yourself consripted. ...\n So get to the steamboat on that isle ... I guess you call it Cormaya, and ask for a passage to Gnomprona. ...\n Talk to Gnominer, the leader of our operations in Gnomprona. He will tell you where your help is needed most.", npc, creature)
			npcHandler:setTopic(playerId, 1)
		end
	end
	return true
end

npcHandler:setMessage(MESSAGE_WALKAWAY, "See you my friend.")
npcHandler:setMessage(MESSAGE_FAREWELL, "See you my friend.")
npcHandler:setMessage(MESSAGE_GREET, "Oh, hello. You might be one of the talented adventurers we are looking for!")
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

-- npcType registering the npcConfig table
npcType:register(npcConfig)
