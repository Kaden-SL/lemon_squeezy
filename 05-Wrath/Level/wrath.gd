extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	Events.wrathstart.connect(music_start)
	
	
func music_start():
	$wrathmusic.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
