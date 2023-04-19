extends KinematicBody2D
 
var speed = 200
var velocity = Vector2()

func _physics_process(delta):
	handle_input()
func handle_input():
	velocity = Vector2()
	
	if Input.is_action_pressed("ui_up")
		velocity.y -= 1 
		
	if Input.is_action_pressed("ui_down")
		velocity.y += 1 
		
			if Input.is_action_pressed("ui_up")
		velocity.x -= 1 
		
	if Input.is_action_pressed("ui_up")
		velocity.x += 1 
		
	velcotiy	.normalized()
	move_and_slide(velocity * speed)
