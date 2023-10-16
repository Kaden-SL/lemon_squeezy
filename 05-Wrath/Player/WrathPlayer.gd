extends CharacterBody2D

@export var speed = 400
var can_move = true

func _physics_process(delta):
	if can_move:
		check_input()

	# Use move_and_slide for movement
	move_and_slide()

	# Reset velocity if a wall is hit
	if is_on_wall() or is_on_floor() or is_on_ceiling():
		velocity = Vector2.ZERO
		can_move = true
func check_input():
	velocity = Vector2.ZERO
	if Input.is_action_pressed('right'):
		velocity.x = 1
	elif Input.is_action_pressed('left'):
		velocity.x = -1
	elif Input.is_action_pressed('up'):
		velocity.y = -1
	elif Input.is_action_pressed('down'):
		velocity.y = 1
	if velocity != Vector2.ZERO:
		velocity = velocity.normalized() * speed
		can_move = false

func _on_wall_collision() -> void:
	self.velocity = Vector2.ZERO
	can_move = true
