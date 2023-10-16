extends CharacterBody2D

@export var speed = 400
var direction : Vector2 = Vector2.ZERO
func _input(event):
	if event is InputEventMouseButton and event.pressed and direction == Vector2.ZERO:
		direction = (event.global_position - global_position).normalized()

func _physics_process(delta):
	self.velocity = direction * speed
	move_and_slide()

	if is_on_wall() or is_on_floor() or is_on_ceiling():
		direction = Vector2.ZERO

#func check_input():
#	velocity = Vector2.ZERO
#	if Input.is_action_pressed('right'):
#		velocity.x = 1
#	elif Input.is_action_pressed('left'):
#		velocity.x = -1
#	elif Input.is_action_pressed('up'):
#		velocity.y = -1
#	elif Input.is_action_pressed('down'):
#		velocity.y = 1
#	if velocity != Vector2.ZERO:
#		velocity = velocity.normalized() * speed
#		can_move = false

#func _on_wall_collision() -> void:
#	self.velocity = Vector2.ZERO
#	can_move = true
