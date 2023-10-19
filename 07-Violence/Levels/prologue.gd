extends Node2D

@onready var proceed = $Button

# Called when the node enters the scene tree for the first time.
func _ready():
	var prologue = Dialogic.start("Violence, Prologue")
	add_child(prologue)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_button_pressed():
	get_tree().change_scene_to_file("res://07-Violence/Levels/first_battle.tscn")
