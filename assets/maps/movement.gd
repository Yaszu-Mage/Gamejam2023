extends KinematicBody2D

onready var anim = get_node("AnimatedSprite")
var speed = 200  # speed in pixels/sec
var velocity = Vector2.ZERO
var upmove = false
var rightmove = false
var leftmove = false
var downmove = false
var lastmove = null

func get_input():
	velocity = Vector2.ZERO
	if Input.is_action_pressed('ui_right'):
		velocity.x += 1
		anim.play("rightwalk")
		var rightmove = true
		var lastmove = 1
	else:
		var rightmove = false
	if Input.is_action_pressed('ui_left'):
		velocity.x -= 1
		anim.play("leftwalk")
		var leftmove = true
		var lastmove = 2
	else:
		var leftmove = false
	if Input.is_action_pressed('ui_down'):
		velocity.y += 1
		anim.play("walkdown")
		var downmove = true
		var lastmove = 3
	else:
		var downmove = false
	if Input.is_action_pressed('ui_up'):
		velocity.y -= 1
		anim.play("upwalk")
		var upmove = true
		var lastmove = 4
	else:
		var upmove = false
	if Input.is_action_just_released("ui_up"):
		anim.play("upidle")
	if Input.is_action_just_released("ui_down"):
		anim.play("idle")
	if Input.is_action_just_released("ui_right"):
		anim.play("rightidle")
	if Input.is_action_just_released("ui_left"):
		anim.play("leftidle")
	
	
	# Make sure diagonal movement isn't faster
	velocity = velocity.normalized() * speed
	
		
		
func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)


