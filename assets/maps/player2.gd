extends CharacterBody2D
@onready var animation = $AnimationPlayer
const SPEED = 500.0
var lastmove = 0
var dashed = false
var currentanimation = null
var enemy_range = false
var enemy_cool = true
var attackip = false
var player_atk = false
var player_range = false
@onready var sync = $MultiplayerSynchronizer
var health = 100
@onready var healthbar = $Sprite/Camera2D/Control/ProgressBar
var alive = true
var deathtimer = false
enum playerstate {
	direction, cords, animation
}
var animation_vector = Vector2()
var res = true
@onready var dashpart = $Sprite/CPUParticles2D
@onready var stamina = $Sprite/Camera2D/Control/ProgressBar.value
func _ready():
	name = str(get_multiplayer_authority())

func _physics_process(_delta):
	
	if is_multiplayer_authority():
		if Input.is_action_just_pressed("Interact"):
			Global.player_current_attack = true
			attackip = true
			if lastmove == 1:
				animation.play("odderf/leftatk")
				$atktimer.start()
				player_atk = true
			if lastmove == 2:
				animation.play("odderf/rightatk")
				$atktimer.start()
				player_atk = true
			if lastmove == 3:
				animation.play("odderf/upattack")
				$atktimer.start()
				player_atk = true
			if lastmove == 4:
				animation.play("odderf/downattack")
				$atktimer.start()
				player_atk = true
			
		
		
		
		enemy_atk()
		var direction:Vector2 = Vector2.ZERO
		var action = Input.get_axis("ui_left", "ui_right")
		if action and alive:
			direction.x = action * SPEED
			if direction.x <= 1:
				animation.play("odderf/leftwalk")
				lastmove = 1
			if direction.x >= -1:
				animation.play("odderf/rightwalk")
				lastmove = 2
		else:
			direction.x = move_toward(velocity.x, 0, SPEED)
			if lastmove == 1:
				if attackip == false:
					animation.play("odderf/leftidle")
			if lastmove == 2:
				if attackip == false:
					animation.play("odderf/rightidle")
		
		var yaction = Input.get_axis("ui_up", "ui_down")
		if yaction and alive:
			direction.y = yaction * SPEED
			if direction.y <= 1:
				animation.play("odderf/upwalk")
				lastmove = 3
			if direction.y >= -1:
				animation.play("odderf/downwalk")
				lastmove = 4
		else:
			direction.y = move_toward(velocity.x, 0, SPEED)
			if lastmove == 3:
				if attackip == false:
					animation.play("odderf/upidle")
			if lastmove == 4:
				if attackip == false:
					animation.play("odderf/downidle")
		if health <= 0:
			alive = false
			health = 0
			animation.play("odderf/deathup")
		currentanimation = $AnimationPlayer.current_animation
		global_position += direction.normalized()
		rpc("remote_set_position", global_position)
		rpc("animationsync", currentanimation)
		rpc("syncatk", attackip, player_atk)
		
		healthbar = $Sprite/Camera2D/Control/ProgressBar
		
		healthbar.value = health
		
		if health >= 100:
			healthbar.visible = false
		else:
			healthbar.visible = true
		
		rpc("healthsync", health)
		

@rpc("unreliable")
func remote_set_position(authority_position):
	global_position = authority_position

@rpc("unreliable")
@warning_ignore("shadowed_variable", "unused_parameter")
func syncatk(attackip, player_atk):
	if attackip:
		Global.player_current_attack = true
		player_atk = true
	else:
		Global.player_current_attack = false
		player_atk = false


@rpc("unreliable")
@warning_ignore("shadowed_variable")
func healthsync(health):
	var healthbar = $Sprite/Camera2D/Control/ProgressBar
	healthbar.value = health
	if health >= 100:
		healthbar.visible = false
	else:
		healthbar.visible = true
@rpc("authority", "call_local", "reliable", 1)
func display_message(message):
	$Message.text = str(message)

@rpc("unreliable")
@warning_ignore("shadowed_variable")
func animationsync(currentanimation):
	$AnimationPlayer.current_animation = currentanimation
@rpc("any_peer", "call_local", "reliable", 1)
func clicked_by_player():
	$Message.text = str(multiplayer.get_remote_sender_id()) + " clicked on me!"

func staminareco():
	for _n in range(100):
		await get_tree().create_timer(1.0).timeout
		stamina = stamina + 10

@warning_ignore("unused_parameter", "shadowed_variable_base_class")
func _on_mouse_click_area_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		rpc("clicked_by_player")


func _on_player_hitbox_body_entered(body):
	if body.has_method("enemy"):
		enemy_range = true
	if body.has_method("player") and not $player_hitbox:
		res = false
		player_range = true


func _on_player_hitbox_body_exited(body):
	if body.has_method("enemy"):
		enemy_range = false
	if body.has_method("player") and not $player_hitbox:
		res = true
		player_range = false
func enemy_atk():
	if enemy_range == true and enemy_cool == true and alive:
		print("dmg")
		health = health - 20
		enemy_cool = false
		$atkcool.start()
	elif player_range == true and enemy_cool == true and alive and player_atk:
		print("dmg")
		health = health - 20
		attackip = true
		enemy_cool = false
		$atkcool.start()
	
	

func player():
	pass

@warning_ignore("unused_parameter")
func _process(delta):
	currentanimation = $AnimationPlayer.current_animation


func _on_atkcool_timeout():
	enemy_cool = true


func _on_death_timeout():
	deathtimer = true


func regen():
	if health < 100:
		health = health + 20
	if health > 100:
		health = 100
	if health <= 0:
		health = 0


func _on_atktimer_timeout():
	$atktimer.stop()
	Global.player_current_attack = false
	attackip = false


func _on_regen_timeout():
	$regen.stop()
	if health < 100:
		health = health + 20
	if health > 100:
		health = 100
	if health <= 0:
		health = 0
