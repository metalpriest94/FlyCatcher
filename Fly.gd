extends DamageDealer

export var flowerTarget: Vector2 = Vector2(0, 0);

var direction: Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	self.position = Vector2(500, 200);
	direction = (flowerTarget - self.position).normalized();	
	pass;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	direction = direction.rotated(rand_range(-1, 1));
	
	var targetDirection = flowerTarget - self.position;
	var targetAngle = lerp_angle(direction.angle(), targetDirection.angle(), 0.2);
	direction = Vector2(cos(targetAngle), sin(targetAngle));
	self.translate(direction * delta * 100);
	

