extends Node2D
onready var tilemap = $TileMap
onready var bush = $TileMap2
onready var trees = $TileMap3

#Biome tilemaps/variables
# 18 Ice Tiles/ 14 Spruce Tiles / 14 Plains Tiles / 6 fire tiles / 7 desert tiles
#hey uh
#biome list; plains, spruce, desert, ice, mesa, dark (noart), candy (noart), pirate (noart)
#buddy, the ice is missing a few. ik you need to add them follow the same pattern also dont delete the comments we mush leave our self in historyyyyyyyyyyyyyyyyyyyyy ikr im so good at this
#you aint doing to well at that.
#imma try and figure out some meth shit
#very: mature
var set_desert = {"desert" : 5, "desert2" : 5, "desert3" : 5, "desert4" : 5, "desert5" : 5, "desert6" : 5}
var set_plain = {"plains" : 85, "plains2" : 5, "plains3" : 85, "plains4" : 5, "plains5" : 5, "plains6" : 5, "plains7" : 5, "plains8" : 5, "plains9" : 5, "plains10" : 5, "plains11" : 5, "plains12" : 5, "plains13" : 5,}
var set_ice = {"ice" : 85, "ice2" : 5, "ice3" : 5, "ice4" : 5, "ice5" : 5, "ice6" : 5, "ice7" : 5, "ice8" : 5, "ice9" : 5, "ice10" : 5, "ice11" : 5, "ice12" : 5, "ice13" : 5, "ice14" : 5, "ice15" : 5, "ice16" : 5, "ice17" : 5,}
var set_fire = {"fire" : 85, "fire2" : 5, "fire3" : 5, "fire4" : 5, "fire5" : 5, "fire6" : 5,}
var set_spruce = {"spruce" : 85, "spruce2" : 5, "spruce3" : 5, "spruce4" : 5, "spruce5" : 5, "spruce6" : 5, "spruce7" : 5, "spruce8" : 5, "spruce9" : 5, "spruce10" : 5, "spruce11" : 5, "spruce12" : 5, "spruce13" : 5, "spruce14" : 5,}
var desertnature = {"sprucestump" : 5, "sprucebush" : 5, "sprucebush2" : 5, "sprucehedge" : 5, "spruceleaf" : 5, "w" : 1000,}
var deserttrees = {"" : 5,}
var plainstrees = {"" : 5} 
var icenature = {"" : 5}
var icetree = {"" : 5}
var firetrees = {"" : 5}
var firenature = {"" : 5}
var plainnature = {"oakstump" : 5, "w" : 1000, "ministump" : 5, "berries" : 5,}
var biome = null
var off = -16
var wid = -16
var hei = -16
var lim = 0
var desert = false
var run = 0
var x = 0
var y = 0



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
	for _n in range(50): #
		biome = randi() % 6 + 1
		if biome == 1:
			hei = -16
			make_chunk(16,16, set_desert)
			wid = wid + 16
			lim = lim + 16
			hei = -16
			if 16 == lim:
				lim = 0
				for _p in range (32):
					desert1()
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
				for _p in range (32):
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
			make_chunk(16,16, set_ice)
			lim = lim + 16
			wid = wid + 16
			hei = -16
			if 16 == lim:
				lim = 0
				for _p in range (32):
					ice()
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
			make_chunk(16,16, set_spruce)
			wid = wid + 16
			lim = lim + 16
			hei = -16
			if 16 == lim:
				lim = 0
				for _p in range (32):
					desert1()
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
			make_chunk(16,16, set_fire)
			wid = wid + 16
			lim = lim + 16
			hei = -16
			if 16 == lim:
				lim = 0
				for _p in range(32):
					fire()
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
		if biome == 6:
			hei = -16
			make_chunk(16,16, set_spruce)
			wid = wid + 16
			lim = lim + 16
			hei = -16
			if 16 == lim:
				lim = 0
				for _p in range(32):
					spruce()
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
		else:
			run = run + 1
			biome = randi() % 3 + 1
			if biome == 1:
				ice()
			if biome == 2:
				spruce()
			if biome == 3:
				fire()
			if biome == 4:
				plains()
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
		run = run + 1
		biome = randi() % 3 + 1
		if biome == 1:
			ice()
		if biome == 2:
			desert1()
		if biome == 3:
			fire()
		if biome == 4:
			spruce()
	if run == 32:
		desert = true
#heheheheheheheheh
#help me
func ice():
	hei = hei + 16
	if biome >= 2:
		make_chunk(16,16, set_ice)
		run = run + 1
	else:
		run = run + 1
		biome = randi() % 3 + 1
		if biome == 1:
			spruce()
		if biome == 2:
			desert1()
		if biome == 3:
			fire()
		if biome == 4:
			plains()
	if run == 32:
		desert = true

func spruce():
	hei = hei + 16
	biome = randi() % 3 + 1
	if biome >= 2:
		make_chunk(16,16, set_spruce)
		make_plain_nature(16,16, desertnature)
		run = run + 1
	else:
		biome = randi() % 3 + 1
		if biome == 1:
			ice()
		if biome == 2:
			desert1()
		if biome == 3:
			fire()
		if biome == 4:
			plains()
		run = run + 1
	if run == 32:
		desert = true

func fire():
	biome = randi() % 3 + 1
	hei = hei + 16
	if biome >= 2:
		make_chunk(16,16, set_fire)
		run = run + 1
	else:
		run = run + 1
		biome = randi() % 3 + 1
		if biome == 1:
			ice()
		if biome == 2:
			desert1()
		if biome == 3:
			spruce()
		if biome == 4:
			plains()
	if run == 32:
		desert = true





