extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	var epilogue = Dialogic.start("Violence, Epilogue")
	add_child(epilogue)
	Dialogic.connect('timeline_ended',dialogue_done)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func dialogue_done():
	get_tree(). change_scene_to_file('res://08-Fraud/Level/fraud.tscn')
