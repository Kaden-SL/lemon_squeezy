extends Node2D


func _ready():
	Dialogic.start('fraud_timeline')
	Dialogic.connect('timeline_ended',dialogue_done)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func dialogue_done():
	get_tree(). change_scene_to_file('res://09-Treachery/Level/Credits.tscn')

