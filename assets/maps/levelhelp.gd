extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	Global.mana = $Mana2.max_value
	Global.stamina = $Stamina.max_value
	if Global.level == +1:
		Global.mana = +10
		Global.stamina = +10
