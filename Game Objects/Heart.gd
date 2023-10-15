extends Area2D
@export var speed = 100

@onready var player = get_parent().get_parent().get_node("TopDownPlayer")
func _physics_process(_delta):
	position = position.move_toward(player.position,_delta*50)
	
func _on_body_entered(body):
	queue_free()
	Events.hearts_collected.emit()
	var hearts=get_tree().get_nodes_in_group("Heart")
	if hearts.size() == 1: 
		Events.full_hearts.emit()
	print(hearts.size())
	
