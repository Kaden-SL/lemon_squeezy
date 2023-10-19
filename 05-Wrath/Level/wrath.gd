extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$wrathmusic.play()
	var timer := Timer.new()
	add_child(timer)
	timer.wait_time = 120.0
	timer.one_shot = true
	timer.start()
	timer.connect("timeout",timeout_func)
	

func timeout_func():
	get_tree(). change_scene_to_file('res://04-Greed/Level/greed.tscn')

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
