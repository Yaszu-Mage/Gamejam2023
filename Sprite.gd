extends KinematicBody2D

var speed = 100


var motion = Vector2. ()

func_process(delta):
	if Global.player !=null:
		velocity = global_position.direction_to(Global._position)
		
		global_position += velocity * speed * delta
			
func _on_Hitbox_area_entered(area):
	if area.is_in_group("Enemy_damager"):
		
		area.get_parent(.queue_free()
