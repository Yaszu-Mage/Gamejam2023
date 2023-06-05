extends TileMap


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta):
	if Global.slotchange:
		if Global.slotamt[1] == 16 or Global.slotamt[2] == 16 or Global.slotamt[3] == 16 or Global.slotamt[4] == 16 or Global.slotamt[5] == 16 or Global.slotamt[6] == 16 or Global.slotamt[7] == 16 or Global.slotamt[8] == 16:
			if Global.slotamt.all == 16:
				Global.slotfull = true
		else:
			Global.slotamt[1] = +1
			itemreco()
			Global.slotfull = false
			
func itemreco():
	pass
