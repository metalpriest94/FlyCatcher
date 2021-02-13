extends Node2D

export var flowerTarget: Vector2 = Vector2(0, 0);

var direction: Vector2

func lerp_angle(from, to, weight):
	return from + short_angle_dist(from, to) * weight;
	
func short_angle_dist(from, to):
	var max_angle = PI * 2;
	var difference = fmod(to - from, max_angle);
	return fmod(2 * difference, max_angle) - difference;

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
