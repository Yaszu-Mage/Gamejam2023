extends StaticBody2D

var state = "nobud" # nobud budyes

var change_state = false

var length_of_nobud = 5 #sec
var length_of_budyes = 5 #sec

func _ready():
	if state == "nobud":
		 $ColorRect.color.a8 = 0
	elif state == "budyes":
		 $ColorRect.color.a8 = 150



func _on_Timer_timeout():
	if state == "nobud":
		state = "budyes"
	elif state == "budyes":
		state = "nobud"
		
	change_state = true
	
func _process(delta):	
	if change_state == true:
		change_state =	 false
		if state == "nobud":
			change_to_nobud()
		elif state == "budyes":
			change_to_budyes()
			
func change_to_nobud():
	$AnimationPlayer.play("budmoonoff")
	$Timer.wait_time = length_of_budyes
	$Timer.start()

func change_to_budyes():
	$AnimationPlayer.play("budmoonon")
	$Timer.wait_time = length_of_nobud
	$Timer.start()
