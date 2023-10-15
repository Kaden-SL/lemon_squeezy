extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	Events.full_hearts.connect(level_complete_hearts)
	Events.hearts_collected.connect(heart_meter)
func heart_meter():
	print('Hearts Collected')
func level_complete_hearts():
	print('Hearts Collected')


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
