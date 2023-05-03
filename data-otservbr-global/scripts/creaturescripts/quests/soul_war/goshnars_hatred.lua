local goshnarsHatred = CreatureEvent("goshnarsHatred")

function goshnarsHatred.onDeath(creature, corpse, killer, mostDamage, unjustified, mostDamage_unjustified)
	applyRandomCurse()
end
goshnarsHatred:register()
