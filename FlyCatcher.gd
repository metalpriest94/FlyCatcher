extends Node2D
var body : KinematicBody2D
var down_velocity = 0.0

const UP_VECTOR = Vector2(0, -1)

# Called when the node enters the scene tree for the first time.
func _ready():
	body = $KinematicBody2D
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	applyGravity()
	
	if Input.is_action_pressed("jump"):
		jump()
	if Input.is_action_pressed("walk_left"):
		walk_left()
	if Input.is_action_pressed("walk_right"):
		walk_right()
	
func jump():
	if (body.is_on_floor()):
		down_velocity = -1000
		

func walk_right():
	if (body.is_on_floor()):
		body.move_and_slide(Vector2(500, 0), UP_VECTOR)
	
func walk_left():
	if (body.is_on_floor()):
		body.move_and_slide(Vector2(-500, 0), UP_VECTOR)
		
func applyGravity():
	if (!body.is_on_floor()):
		down_velocity += 2
		
	else:
		down_velocity = 0.0
	
func applyVelocity():
	body.move_and_slide_with_snap(Vector2(0, down_velocity), UP_VECTOR, UP_VECTOR)
