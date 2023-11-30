extends CharacterBody2D

#Creates variable to store data for later
var collision_data
var respawnPosition

#Send the ball off in a set direction at game start, determine speed
func _ready():
	respawnPosition = self.global_position
	velocity.x = 300
	velocity.y = 500

func _set_ball_position():
	self.global_position = respawnPosition
#Allows for smoother ball movement
func _physics_process(delta):
	collision_data = move_and_collide(velocity * delta)
	if collision_data:
		velocity.y += randf_range(-20, 20) 
		velocity = velocity.bounce(collision_data.get_normal())


func _on_reset_wall_opponent_body_entered(_body):
	_set_ball_position()


func _on_reset_wall_player_body_entered(body):
	_set_ball_position()
