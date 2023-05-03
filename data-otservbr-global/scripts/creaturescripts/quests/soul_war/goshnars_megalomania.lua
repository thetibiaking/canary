local goshnarsMegalomania = CreatureEvent("goshnarsMegalomania")

function goshnarsMegalomania.onDeath(creature, corpse, killer, mostDamage, unjustified, mostDamage_unjustified)
	hasKilledMegalomania()
end
goshnarsMegalomania:register()
