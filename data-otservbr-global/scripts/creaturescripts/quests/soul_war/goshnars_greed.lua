local goshnarsGreed = CreatureEvent("goshnarsGreed")

function goshnarsGreed.onDeath(creature, corpse, killer, mostDamage, unjustified, mostDamage_unjustified)
	applyRandomCurse()
end
goshnarsGreed:register()
