local goshnarsCruelty = CreatureEvent("goshnarsCruelty")

function goshnarsCruelty.onDeath(creature, corpse, killer, mostDamage, unjustified, mostDamage_unjustified)
	applyRandomCurse()
end
goshnarsCruelty:register()
