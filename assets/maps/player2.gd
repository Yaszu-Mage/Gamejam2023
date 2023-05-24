extends CharacterBody2D
@onready var animation = $AnimationPlayer
const SPEED = 500.0
var lastmove = 0
var dashed = false
var enemy_range = false
var enemy_cool = true
@onready var health = $ProgressBar2.value
var alive = true
var deathtimer = false
var res = true
@onready var dashpart = $Sprite/CPUParticles2D
@onready var stamina = $Sprite/Camera2D/Control/ProgressBar.value
func _ready():
	name = str(get_multiplayer_authority())

func _physics_process(delta):

	if is_multiplayer_authority():
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
				animation.play("odderf/leftidle")
			if lastmove == 2:
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
				animation.play("odderf/upidle")
			if lastmove == 4:
				animation.play("odderf/downidle")
		if health <= 0:
			alive = false
			health = 0
			animation.play("odderf/damagedown")
			self.queue_free()
			if deathtimer and res:
				animation.play("odderf/deathup")
				get_tree().quit()
				self.queue_free()
		
		
		global_position += direction.normalized()
		rpc("remote_set_position", global_position)

@rpc("unreliable")
func remote_set_position(authority_position):
	global_position = authority_position

@rpc("authority", "call_local", "reliable", 1)
func display_message(message):
	$Message.text = str(message)
	
@rpc("any_peer", "call_local", "reliable", 1)
func clicked_by_player():
	$Message.text = str(multiplayer.get_remote_sender_id()) + " clicked on me!"

func staminareco():
	for _n in range(100):
		await get_tree().create_timer(1.0).timeout
		stamina = stamina + 10

func _on_mouse_click_area_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		rpc("clicked_by_player")


func _on_player_hitbox_body_entered(body):
	if body.has_method("enemy"):
		enemy_range = true
	if body.has_method("player"):
		res = false


func _on_player_hitbox_body_exited(body):
	if body.has_method("enemy"):
		enemy_range = false
	if body.has_method("player"):
		res = true

func enemy_atk():
	if enemy_range == true and enemy_cool == true and alive:
		print("dmg")
		health = health - 20
		enemy_cool = false
		$atkcool.start()
		
	
	

func player():
	pass



func _on_atkcool_timeout():
	enemy_cool = true


func _on_death_timeout():
	deathtimer = true
