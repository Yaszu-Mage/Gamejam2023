extends KinematicBody2D

onready var anim = get_node("AnimatedSprite")
var speed = 200  # speed in pixels/sec
var velocity = Vector2.ZERO
var upmove = false
var rightmove = false
var leftmove = false
var downmove = false



func get_input():
	velocity = Vector2.ZERO
	if Input.is_action_pressed('ui_right'):
		velocity.x += 1
		anim.play("rightwalk")
		var rightmove = true
	else:
		var rightmove = false
	if Input.is_action_pressed('ui_left'):
		velocity.x -= 1
		anim.play("leftwalk")
		var leftmove = true
	else:
		var leftmove = false
	if Input.is_action_pressed('ui_down'):
		velocity.y += 1
		anim.play("downwalk")
		var downmove = true
	else:
		var downmove = false
	if Input.is_action_pressed('ui_up'):
		velocity.y -= 1
		anim.play("upwalk")
		var upmove = true
	else:
		var upmove = false
	# Make sure diagonal movement isn't faster
	velocity = velocity.normalized() * speed
	
	
func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
