extends CharacterBody2D

@export var speed = 200  # speed in pixels/sec
var counter : int = 0

func _physics_process(_delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	move_and_slide()




func _on_area_2d_body_entered(body):
	if body.is_in_group("Heart"):
		print('heartreg')

