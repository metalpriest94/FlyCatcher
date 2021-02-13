extends DamageTaker
class_name Flower

var basePetal = load("res://Petal.tscn");
var health = 50;

func _ready():
	attachPetals();
	
func attachPetals():
#	for i in range(health):
#		petal = basePetal.instance();
		
	pass

func takeDamage(damageDealer, attackDamage: int):
	attackDamage = min(attackDamage, health);
	health -= attackDamage;
	removePetals(attackDamage);
	return attackDamage;
	
func removePetals(amountOfPetals: int):
	# Remove the petals.
	pass;
