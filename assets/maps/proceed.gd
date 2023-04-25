extends Node2D
onready var tilemap = $TileMap
onready var bush = $TileMap2
onready var trees = $Tilemap3
#Ghost was here
#FUCK YOUUUUUUUUUUUUUUUUUUUUUUUUU
#I know this shit because of modding on steam
#Biome Documentation
#Biome tilemaps/variables
# 18 Ice Tiles/ 14 Spruce Tiles / 14 Plains Tiles / 6 fire tiles / 7 desert tiles
#hey uh
#biome list; plains, spruce, desert, ice, mesa, dark (noart), candy (noart), pirate (noart)
#buddy, the ice is missing a few. ik you need to add them follow the same pattern also dont delete the comments we mush leave our self in historyyyyyyyyyyyyyyyyyyyyy ikr im so good at this
#you aint doing to well at that.
#imma try and figure out some meth shit
var set_desert = {"desert" : 5, "desert1" : 5, "desert2" : 5, "desert3" : 5, "desert4" : 5, "desert5" : 5, "desert6" : 5}
var set_plain = {"plains" : 5, "plains1" : 5, "plains2" : 5, "plains3" : 85, "plains4" : 5, "plains5" : 5, "plains6" : 5, "plains7" : 5, "plains8" : 5, "plains9" : 5, "plains10" : 5, "plains11" : 5, "plains12" : 5, "plains13" : 5,}
var set_ice = {"ice" : 5, "ice1" : 5, "ice2" : 5, "ice3" : 5, "ice4" : 5, "ice5" : 5, "ice6" : 5, "ice7" : 5, "ice8" : 5, "ice9" : 5, "ice10" : 5, "ice11" : 5, "ice12" : 5, "ice13" : 5, "ice14" : 5, "ice15" : 5, "ice16" : 5, "ice17" : 5,}
var set_fire = {"fire" : 5,}
var desertnatrue = {"sprucestump" : 5, "sprucebush" : 5, "sprucebush2" : 5, "sprucehedge" : 5, "spruceleaf" : 5,}
var deserttrees = {"" : 5,}
var plainstrees = {"" : 5}
var icenature = {"" : 5}
var icetree = {"" : 5}
var firetrees = {"" : 5}
var firenature = {"" : 5}
var plainnature = {"oakstump" : 5, "w" : 1000, "ministump" : 5, "berries" : 5,}
var biome = null
var off = -16
var i = 0
var j = 0
var wid = -16
var hei = -16
var lim = 0
var desert = false
var run = 0

func _ready():
	randomize()
	biomes()


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

func biomes():
	off = -2
	for n in range(100):
		biome = randi() % 6 + 1
		if biome == 1:
			hei = -16
			make_chunk(16,16, set_desert)
			wid = wid + 16
			lim = lim + 16
			hei = -16
			if 16 == lim:
				lim = 0
				for p in range (32):
					desert()
					if desert == true:
						print("------------")
						print("biome: desert")
						print("width:", wid)
						print("limiter:", lim)
						print("height:", hei)
						print("1")
						print("------------")
						hei = -16
						lim = 0
						desert = false
		if biome == 2:
			hei = -16
			make_chunk(16,16, set_plain)
			lim = lim + 16
			wid = wid + 16
			hei = -16
			if 16 == lim:
				lim = 0
				for p in range (32):
					plains()
					if desert == true:
						print("------------")
						print("biome: plains")
						print("width:", wid)
						print("limiter:", lim)
						print("height:", hei)
						print("3")
						print("------------")
						hei = -16
						lim = 0
						desert = false
		if biome == 3:
			hei = -16
			make_chunk(16,16, set_plain)
			lim = lim + 16
			wid = wid + 16
			hei = -16
			if 16 == lim:
				lim = 0
				for p in range (32):
					plains()
					if desert == true:
						print("------------")
						print("biome: plains")
						print("width:", wid)
						print("limiter:", lim)
						print("height:", hei)
						print("3")
						print("------------")
						hei = -16
						lim = 0
						desert = false
		if biome == 4:
			hei = -16
			make_chunk(16,16, set_desert)
			wid = wid + 16
			lim = lim + 16
			hei = -16
			if 16 == lim:
				lim = 0
				for p in range (32):
					desert()
					if desert == true:
						print("------------")
						print("biome: desert")
						print("width:", wid)
						print("limiter:", lim)
						print("height:", hei)
						print("4")
						print("------------")
						hei = -16
						lim = 0
						desert = false
		if biome == 5:
			hei = -16
			make_chunk(16,16, set_desert)
			wid = wid + 16
			lim = lim + 16
			hei = -16
			if 16 == lim:
				lim = 0
				for p in range(32):
					ice()
					if desert == true:
						print("------------")
						print("biome: ice")
						print("width:", wid)
						print("limiter:", lim)
						print("height:", hei)
						print("5")
						print("------------")
						hei = -16
						lim = 0
						desert = false
	
func desert():
	biome = randi() % 3 + 1
	hei = hei + 16
	if biome >= 2:
		make_chunk(16,16, set_desert)
		run = run + 1
	else:
		biome = randi() % 2 + 1
		run = run + 1
		if biome == 1:
			make_chunk(16,16, set_plain)
			make_plain_nature(16,16, plainnature)
		if biome == 2:
			make_chunk(16,16, set_ice)
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
		if biome == 1:
			make_chunk(16,16, set_desert)
		if biome == 2:
			make_chunk(16,16, set_ice)
		desert= true
#heheheheheheheheh
#help me
func ice():
	hei = hei + 16
	if biome >= 2:
		make_chunk(16,16, set_plain)
		make_plain_nature(16,16, plainnature)
		run = run + 1
	else:
		biome = randi() % 2 + 1
		run = run + 1
		biomes()
	if run == 32:
		desert = true

func spruce():
	hei = hei + 16
	if biome >= 2:
		make_chunk(16,16, set_desert)
		make_plain_nature(16,16, desertnatrue)
		run = run + 1
	else:
		biome = randi() % 2 + 1
		run = run + 1
		biomes()
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
		biomes()
	if run == 32:
		desert = true