extends CharacterBody2D


const SPEED = 500.0

func _physics_process(_delta):
	# Get the input direction and handle the movement/deceleration.
	var direction = Input.get_axis("up", "down")
	if direction:
		velocity.y = direction * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()
