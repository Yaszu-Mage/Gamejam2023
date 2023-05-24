extends CharacterBody2D
var speed = 500
var player_chase = false
var player = null
@onready var animation = $AnimationPlayer
var look = null



func _physics_process(delta):
	if player_chase:
		speed = 50
		position += (player.position - position)/speed
		global_position += (player.position - position)/speed
		rpc("remote_set_position", global_position)

func _on_detect_body_entered(body):
	player = body
	player_chase = true


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