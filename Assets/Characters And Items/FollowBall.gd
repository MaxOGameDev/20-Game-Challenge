extends CharacterBody2D

#determine the speed at which the paddle can move
const SPEED = 500.0

func _physics_process(delta):
	#Get the position of the ball and store is as direction variable
	var direction = get_parent().get_node("Ball").position
	#Variable stores where the paddles target position should be
	#position.x is irrelevant since it can't move that way
	#direction.y makes the target position vertically synced with the postion of the ball
	var paddle_target_pos = Vector2(position.x , direction.y)
	
	#Make paddle move towards target position using speed variable 
	#Multiply speed variable by delta so speed isn't influenced by FPS
	position = position.move_toward (paddle_target_pos, SPEED * delta)
	
	
