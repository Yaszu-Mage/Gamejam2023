# put script and sh|t here
extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Start_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://assets/maps/move.tscn")


func _on_Options_pressed():
	var options = load("res://assets/scenes/options.tscn").instance()
	get_tree().change_scene("res://assets/scenes/options.tscn")




func _on_Quit_pressed():
	get_tree().quit
