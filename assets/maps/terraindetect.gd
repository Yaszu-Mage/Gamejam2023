extends Area2D
signal terraintype

enum terrain {
	plains = 0,
	water = 1,
	beach = 2,
	jungle = 3,
	jungle2 = 5,
	desert = 4,
	candy = 6,
	fire = 7,
	banana = 8,
}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta):
	pass


@warning_ignore("unused_parameter")
func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	_processtilemap(body, body_rid)

@warning_ignore("unused_parameter")
func _processtilemap(body: Node2D, bodyrid: RID) -> void:
	@warning_ignore("unused_variable")
	var currenttilemap = body
