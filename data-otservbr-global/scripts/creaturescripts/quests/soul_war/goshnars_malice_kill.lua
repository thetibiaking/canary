local goshnarsMalice = CreatureEvent("goshnarsMalice")

function goshnarsMalice.onDeath(creature, corpse, killer, mostDamage, unjustified, mostDamage_unjustified)
	applyRandomCurse()
end
goshnarsMalice:register()
