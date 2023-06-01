extends CharacterBody2D
var speed = 500
var player_chase = false
var player = null
@onready var anim = $AnimationPlayer
var look = null
var health = 100
var player_inattack = false
var alive = true
var attack_ip = false
var can_take_dmg = true
func _physics_process(delta):
	deal_with_damage()
	if player_chase:
		speed = 100
		position += (player.position - position)/speed
		global_position += (player.position - position)/speed
		rpc("remote_set_position", global_position)

func _on_detect_body_entered(body):
	player = body
	if body.velocity.x <= 1:
		anim.play("odderf/rightwalk")
	elif body.velocity.x >= -1:
		anim.play("odderf/leftwalk")
	elif body.velocity.y <= 1:
		anim.play("odderf/upwalk")
	elif body.velocity.y >= -1:
		anim.play("odderf/downwalk")
	elif body.velocity.x and body.velocity.y == 0:
		anim.play("odderf/yawn")
	player_chase = true


func _process(delta):
	var healthbar = $ProgressBar
	if alive == false:
		player = null
		player_chase = false
		$enemy_hitbox.monitoring = false
		self.visible = false
	else:
		$enemy_hitbox.monitoring = true
		self.visible = true
	healthbar.value = health
func _on_detect_body_exited(body):
	player = null
	player_chase = false

func enemy():
	pass

@rpc("unreliable")
func remote_set_position(authority_position):
	global_position = authority_position

@rpc("authority", "call_local", "reliable", 1)
func display_message(message):
	$Message.text = str(message)
	
@rpc("any_peer", "call_local", "reliable", 1)
func clicked_by_player():
	$Message.text = str(multiplayer.get_remote_sender_id()) + " clicked on me!"


func _on_enemy_hitbox_body_entered(body):
	if body.has_method("player"):
		player_inattack = true


func _on_enemy_hitbox_body_exited(body):
	if body.has_method("player"):
		player_inattack = false


func deal_with_damage():
	var healthbar = $ProgressBar
	healthbar.value = health
	if player_inattack and Global.player_current_attack == true:
		if can_take_dmg:
			health = health - 20
			
			print("slime health = ", health)
			$dmgcool.start()
			can_take_dmg = false
			if health <= 0:
				alive = false
			


func _on_dmgcool_timeout():
	can_take_dmg = true

