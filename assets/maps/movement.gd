extends KinematicBody2D

onready var anim = $AnimationPlayer
var speed = 1000  # speed in pixels/sec
var velocity = Vector2.ZERO
var upmove = false
var rightmove = false
var leftmove = false
var downmove = false
var lastmove = null
var idle = false
var animfinished = false
var collide = false
onready var start = $AnimationPlayer.play("downidle")

func get_input():
	velocity = Vector2.ZERO
	if Input.is_action_pressed('ui_right'):
		velocity.x += 1
		anim.play("rightwalk")
		rightmove = true
		lastmove = 1
	else:
		rightmove = false
	if Input.is_action_pressed('ui_left'):
		velocity.x -= 1
		anim.play("leftwalk")
		leftmove = true
		lastmove = 2
	else:
		leftmove = false
	if Input.is_action_pressed('ui_down'):
		velocity.y += 1
		anim.play("downwalk")
		downmove = true
		lastmove = 3
	else:
		downmove = false
	if Input.is_action_pressed('ui_up'):
		velocity.y -= 1
		anim.play("upwalk")
		upmove = true
		lastmove == 4
	else:
		upmove = false
	if Input.is_action_just_released("ui_up"):
		anim.play("upidle")
		idle = true
	else:
		idle = false
	if Input.is_action_just_released("ui_down"):
		anim.play("downidle")
		idle = true
	else:
		idle = false
	if Input.is_action_just_released("ui_right"):
		anim.play("rightidle")
		idle = true
	else:
		idle = false
	if Input.is_action_just_released("ui_left"):
		anim.play("leftidle")
		idle = true
	else:
		idle = false
	velocity = velocity.normalized() * speed
func interact():
		if Input.is_action_just_pressed("Interact"):
			if lastmove == 1:
				anim.play("leftint")
			if lastmove == 3:
				anim.play("upint")
			if lastmove == 2:
				anim.play("rightint")
			if lastmove == 4:
				anim.play("downint")

func intanim():
		if animfinished == true:
			anim.stop()
			if lastmove == 1:
				anim.play("yawn")
			if lastmove == 3:
				anim.play("yawn")
			if lastmove == 2:
				anim.play("yawn")
			if lastmove == 4:
				anim.play("yawn")

	
		
		
func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
	interact()
	intanim()




func _on_AnimationPlayer_animation_finished(upint):
	animfinished = true
	animfinished = false
