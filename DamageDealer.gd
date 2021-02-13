extends Node2D
class_name DamageDealer

var attackDamage = 0;

func dealDamage(damageTaker: DamageTaker):
	var _dealtDamage = damageTaker.takeDamage(self, attackDamage);

