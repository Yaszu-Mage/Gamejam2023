extends CollisionShape2D
onready var health = $"../Sprite/Camera2D/Control/ProgressBar"
onready var def = $"../Sprite/Camera2D/Control/ProgressBar2"
var dam = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Player_input_event(viewport, event, shape_idx):
	if def.value >= 0:
		health.value = health.value - 25
	else:
		def.value = def.value - 25


func _on_KinematicBody2D2_input_event(viewport, event, shape_idx):
	if def.value >= 0:
		health.value = health.value - 25
	else:
		def.value = def.value - 25


func _on_hit_body_entered(body):
	dam = true
	while dam == true:
		if def.value >= 0:
			health.value = health.value - 25
		else:
			def.value = def.value - 25


func _on_hit_body_exited(body):
	dam = false
