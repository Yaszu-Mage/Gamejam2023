extends Node2D

onready var tilemap :=$"."
export var width := 320
export var height := 151
export var in_seed := ""
var osn := OpenSimplexNoise.new()



func _ready() -> void:
	randomize()
	if in_seed:
		osn.seed = hash(in_seed)
		print(hash(in_seed))
	else:
		osn.seed = randi()
	generate_map()

func generate_map() -> void:
	for x in width:
		for y in height:
			var rand := floor((abs(osn.get_noise_2d(x,y)))*1)
			tilemap.set_cell(x,y, rand)
	pass


