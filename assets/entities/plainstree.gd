extends StaticBody2D
var health = 0
var can_dmg = false
var cool = true


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	dmg()


func dmg():
	if can_dmg and cool:
		health = health - 20
		print(health)
	if health <= 0:
		var moon = randi_range(1,5)
		
		if moon >= 3:
			var item = preload("res://assets/items/wood.tscn").instantiate()
			add_sibling(item)
			item.position = self.position
			dmg()
		else:
			print("kys")
			self.queue_free()
func _on_area_2d_body_entered(body):
	if body.has_method("player") and Global.player_current_attack and cool:
		can_dmg = true
		cool = false
		$dmgcool.start()
	else:
		can_dmg = false


func _on_dmgcool_timeout():
	cool = true
