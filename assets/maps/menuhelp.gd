extends HBoxContainer
@onready var invmenu = self
var menvisible = false
@onready var player = $"../.."
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_end"):
		if is_multiplayer_authority():
			if menvisible == true:
				invmenu.visible = false
				menvisible = false
			else:
				invmenu.visible = true
				menvisible = true






func _on_color_picker_color_changed(color):
	player.self_modulate = color
	rpc("colorsync", color, player)
	
@rpc("unreliable")
func colorsync(color, player):
	$Sprite.self_modulate = color
