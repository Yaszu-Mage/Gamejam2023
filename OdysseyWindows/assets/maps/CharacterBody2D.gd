extends CharacterBody2D
@onready var animation = $AnimationPlayer
@onready var dashpart = $Sprite/CPUParticles2D
@onready var stamina = $Sprite/Camera2D/Control/ProgressBar.value
var lastmove = 0
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var dashed = false
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func staminareco():
	for _n in range(100):
		await get_tree().create_timer(1.0).timeout
		stamina = stamina + 10

func _physics_process(delta):
	if Input.is_action_pressed("Dash"):
		if dashed == true:
			pass
		else:
			if lastmove == 1:
				if stamina == 0:
					staminareco()
				else:
					velocity.x = -8 * SPEED
					dashpart.emitting = true
					dashed = true
					dashed = false
					stamina = stamina - 10
					await get_tree().create_timer(1.0).timeout
					dashpart.emitting = false
			if lastmove == 2:
				if stamina == 0:
					staminareco()
				else:
					velocity.x = 8 * SPEED
					dashpart.emitting = true
					dashed = true
					dashed = false
					await get_tree().create_timer(1.0).timeout
					dashpart.emitting = false
			if lastmove == 3:
				if stamina == 0:
					staminareco()
				else:
					velocity.y = -8 * SPEED
					dashpart.emitting = true
					dashed = true
					dashed = false
					await get_tree().create_timer(1.0).timeout
					dashpart.emitting = false
			if lastmove == 4:
				if stamina == 0:
					staminareco()
				else:
					velocity.y = 8 * SPEED
					dashpart.emitting = true
					dashed = true
					dashed = false
					await get_tree().create_timer(1.0).timeout
					dashpart.emitting = false
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		if velocity.x <= 1:
			animation.play("odderf/leftwalk")
			lastmove = 1
		if velocity.x >= -1:
			animation.play("odderf/rightwalk")
			lastmove = 2
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if lastmove == 1:
			animation.play("odderf/leftidle")
		if lastmove == 2:
			animation.play("odderf/rightidle")

	var ydirection = Input.get_axis("ui_up", "ui_down")
	if ydirection:
		velocity.y = ydirection * SPEED
		if velocity.y <= 1:
			animation.play("odderf/upwalk")
			lastmove = 3
		if velocity.y >= -1:
			animation.play("odderf/downwalk")
			lastmove = 4
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
		if lastmove == 3:
			animation.play("odderf/upidle")
		if lastmove == 4:
			animation.play("odderf/downidle")
	move_and_slide()


func _on_dash_timeout():
	dashed = false
