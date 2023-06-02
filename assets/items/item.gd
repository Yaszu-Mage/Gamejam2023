extends StaticBody2D
@onready var anim = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	anim.play("item")


# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta):
	pass


@warning_ignore("unused_parameter")
func _on_pickup_radius_area_entered(area):
	pass


func _on_pickup_radius_body_entered(body):
	if body.has_method("player") and Global.player_has_slot:
		Global.slots = [0,0,0,0,0,0,0,0+1]
		Global.slotchange = true
		self.queue_free()
