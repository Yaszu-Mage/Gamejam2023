# put script and sh|t here
extends Control
var mainscene = preload("res://assets/maps/World.tscn").instantiate()
var  options = preload("res://assets/scenes/options.tscn").instantiate()

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
	get_tree().get_root().add_child(mainscene)
	


func _on_Options_pressed():
	@warning_ignore("unused_variable", "shadowed_variable")
	var options = load("res://assets/scenes/options.tscn").instance()
	get_tree().change_scene("res://assets/scenes/options.tscn")




func _on_Quit_pressed():
	@warning_ignore("standalone_expression", "standalone_expression", "standalone_expression", "standalone_expression", "standalone_expression", "standalone_expression")
	get_tree().quit
