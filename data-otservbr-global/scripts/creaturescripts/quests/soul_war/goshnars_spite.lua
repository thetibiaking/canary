local goshnarsSpite = CreatureEvent("goshnarsSpite")

function goshnarsSpite.onDeath(creature, corpse, killer, mostDamage, unjustified, mostDamage_unjustified)
	applyRandomCurse()
end
goshnarsSpite:register()
