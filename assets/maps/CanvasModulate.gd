extends CanvasModulate
@onready var ani = $AnimationPlayer

func _process(delta):
	pass
	
func _ready():
	var blood = randf_range(0.0, 100.0)
	ani.play("Day_Night")


func _on_animation_player_animation_finished(anim_name):
	var blood = randf_range(0.0, 100.0)
	if blood <= 90:
		ani.play("Day_Night")
	else:
		ani.play("Blood")
