extends Node2D
onready var tilemap = $TileMap
onready var bush = $TileMap2
onready var trees = $TileMap3
var set_desert = {"desert" : 5, "desert2" : 5, "desert3" : 5, "desert4" : 5, "desert5" : 5, "desert6" : 5}
var set_plain = {"plains" : 85, "plains2" : 5, "plains3" : 85, "plains4" : 5, "plains5" : 5, "plains6" : 5, "plains7" : 5, "plains8" : 5, "plains9" : 5, "plains10" : 5, "plains11" : 5, "plains12" : 5, "plains13" : 5,}
var set_ice = {"ice" : 85, "ice2" : 5, "ice3" : 5, "ice4" : 5, "ice5" : 5, "ice6" : 5, "ice7" : 5, "ice8" : 5, "ice9" : 5, "ice10" : 5, "ice11" : 5, "ice12" : 5, "ice13" : 5, "ice14" : 5, "ice15" : 5, "ice16" : 5, "ice17" : 5,}
var set_fire = {"fire" : 85, "fire2" : 5, "fire3" : 5, "fire4" : 5, "fire5" : 5, "fire6" : 5,}
var set_spruce = {"spruce" : 85, "spruce2" : 5, "spruce3" : 5, "spruce4" : 5, "spruce5" : 5, "spruce6" : 5, "spruce7" : 5, "spruce8" : 5, "spruce9" : 5, "spruce10" : 5, "spruce11" : 5, "spruce12" : 5, "spruce13" : 5, "spruce14" : 5,}
var desertnatrue = {"sprucestump" : 5, "sprucebush" : 5, "sprucebush2" : 5, "sprucehedge" : 5, "spruceleaf" : 5,}
var deserttrees = {"" : 5,}
var plainstrees = {"" : 5} 
var icenature = {"" : 5}
var icetree = {"" : 5}
var firetrees = {"" : 5}
var firenature = {"" : 5}
var plainnature = {"oakstump" : 5, "w" : 1000, "ministump" : 5, "berries" : 5,}
var biome = null
var wid = -16
var hei = -16
var lim = 0
var desert = false
var run = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func get_random_weigths(set:Dictionary) -> int:
	var sum_weigths:float = 0.0
	var offset:float = 0
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



func make_plain_nature(width:int, height:int, set:Dictionary) -> void:
	for i in width:
		for j in height:
				var tile_name:String = set.keys()[get_random_weigths(set)]
				bush.set_cell(i + wid, j + hei, bush.tile_set.find_tile_by_name(tile_name))


func make_chunk(width:int, height:int, set:Dictionary) -> void:
	for i in width:
		for j in height:
				var tile_name:String = set.keys()[get_random_weigths(set)]
				tilemap.set_cell(i + wid, j + hei, tilemap.tile_set.find_tile_by_name(tile_name))
				
func make_the_lorax(width:int, height:int, set:Dictionary) -> void:
	for i in width:
		for j in height:
				var tile_name:String = set.keys()[get_random_weigths(set)]
				trees.set_cell(i + wid, j + hei, trees.tile_set.find_tile_by_name(tile_name))
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func desert1():
	biome = randi() % 3 + 1
	hei = hei + 16
	if biome >= 2:
		make_chunk(16,16, set_desert)
		run = run + 1
	else:
		biome = randi() % 2 + 1
		run = run + 1
		if biome >= 2:
			make_chunk(16,16, set_desert)
	if run == 32:
		desert = true
func plains():
	hei = hei + 16
	biome = randi() % 3 + 1
	if biome >= 2:
		make_chunk(16,16, set_plain)
		make_plain_nature(16,16, plainnature)
		run = run + 1
	else:
		biome = randi() % 2 + 1
		run = run + 1
		desert= true
#heheheheheheheheh
#help me
func ice():
	hei = hei + 16
	if biome >= 2:
		make_chunk(16,16, set_ice)
		make_plain_nature(16,16, icenature)
		run = run + 1
	else:
		biome = randi() % 2 + 1
		run = run + 1
	if run == 32:
		desert = true

func spruce():
	hei = hei + 16
	if biome >= 2:
		make_chunk(16,16, set_desert)
		make_plain_nature(16,16, set_spruce)
		run = run + 1
	else:
		biome = randi() % 2 + 1
		run = run + 1
	if run == 32:
		desert = true

func fire():
	hei = hei + 16
	if biome >= 2:
		make_chunk(16,16, set_fire)
		make_plain_nature(16,16, firenature)
		run = run + 1
	else:
		biome = randi() % 2 + 1
		run = run + 1
	if run == 32:
		desert = true
