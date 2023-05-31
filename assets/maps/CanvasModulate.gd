extends CanvasModulate
@onready var ani = $AnimationPlayer
var blood = null
var bloodmoon = true
var bloodjust = false
func _process(delta):
	pass
	
func _ready():
	time()
	##ani.play("Day_Night")
	self.visible = false


func _on_animation_player_animation_finished(anim_name):
	time()
	musicoff()


func _on_host_pressed():
	self.visible = true


func _on_join_pressed():
	self.visible = true


func _on_area_2d_body_entered(body):
	if body.has_method("player") and bloodmoon:
		$"../Node2D/FirstDay".playing = true


func _on_area_2d_body_exited(body):
	if body.has_method("player") and bloodmoon:
		$"../Node2D/FirstDay".playing = false
		
func time():
	blood = randi() % 1 + 100
	if blood <= 90:
		bloodmoon = false
		$"../Node2D/Darkchi".playing = true
		$"../Node2D/Darkchi".stream.loop = true
		$"../Node2D/mwa".playing = true
		ani.play("Blood")
		bloodjust = true
	else:
		bloodmoon = true
		ani.play("Day_Night")
		bloodjust = false
		if $"../Node2D/FirstDay".playing == false:
			$"../Node2D/FirstDay".playing = true
func musicoff():
	if bloodjust:
		$"../Node2D/FirstDay".stream_paused = true
		$"../Node2D/Darkchi".playing = false
		$"../Node2D/mwa".playing = false
	else:
		$"../Node2D/Darkchi".playing = false
		$"../Node2D/mwa".playing = false
