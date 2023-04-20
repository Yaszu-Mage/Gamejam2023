extends Node2D
onready var tilemap = $TileMap
onready var bush = $TileMap2
var set_desert = {"5" : 85, "31" : 10, "30" : 5}
var set_plain = {"29" : 5, "8" : 5, "7" : 5, "5" : 85, "31" : 5, "30" : 5, "62" : 5,}
var bushvar = {"w" : 85, "berries" : 5,}

func _ready():
	randomize()
	make_chunk(100,100, set_plain)



func make_chunk(width:int, height:int, set:Dictionary) -> void:
	for i in width:
		for j in height:
			var tile_name:String = set.keys()[get_random_weigths(set)]
			tilemap.set_cell(i, j, tilemap.tile_set.find_tile_by_name(tile_name))

func get_random_weigths(set:Dictionary) -> int:
	var sum_weigths:float = 0.0
	var offset:float = 0.0
	var index:int = 0
	var rnd:float = randf()

	for value in set.values():
		sum_weigths += value

	for value in set.values():
		if rnd <= (offset + value) / sum_weigths:
			return index
		index += 1
		offset += value 
	return index    
