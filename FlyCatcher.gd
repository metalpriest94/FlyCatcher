extends Node2D
var rigidbody : RigidBody2D
var onFloor = true;

# Called when the node enters the scene tree for the first time.
func _ready():
	rigidbody = $RigidBody2D
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("jump"):
		jump()
	if Input.is_action_pressed("walk_left"):
		walk_left(delta)
	if Input.is_action_pressed("walk_right"):
		walk_right(delta)
	print_debug(rigidbody.linear_velocity)
	pass

func jump():
	if (onFloor):
		rigidbody.set_axis_velocity(Vector2(rigidbody.linear_velocity.x, -150))

func walk_right(delta :float):
	if (onFloor):
		rigidbody.set_linear_velocity(Vector2(50, rigidbody.linear_velocity.y))
	
func walk_left(delta :float):
	if (onFloor):
		rigidbody.set_linear_velocity(Vector2(-50, rigidbody.linear_velocity.y))
	
