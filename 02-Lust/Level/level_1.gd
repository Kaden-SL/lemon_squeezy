extends Node2D

var value
# Called when the node enters the scene tree for the first time.
func _ready():
	Events.full_hearts.connect(level_complete_hearts)
	Events.hearts_collected.connect(heart_meter)
func heart_meter():
	var hearts=get_tree().get_nodes_in_group("Heart")
	value = $CanvasLayer/heartmeter.get_value()
	$CanvasLayer/heartmeter.set_value(value+20)
#	print('Map',hearts.size())
func level_complete_hearts():
	pass
#	print('Hearts Collected')


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
