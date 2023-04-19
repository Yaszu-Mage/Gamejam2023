extends KinematicBody2D

var speed = 200


var motion = Vector2. ()

func_process(delta):
	if Global.player !=null:
		velocity = global_position.direction_to(Global._position)
		
		global_position += velocity * speed * delta
		

