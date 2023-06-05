extends Area2D
var speed = 300 
var velocity = Vector2.ZERO


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func _get_input():
	if Input.is_action_just_pressed("ui_up"):
		velocity.x += 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
