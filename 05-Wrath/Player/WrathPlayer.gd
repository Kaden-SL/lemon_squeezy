extends CharacterBody2D

@export var speed = 400
var can_move = true
var direction : Vector2 = Vector2.ZERO
func _input(event):
	if event is InputEventMouseButton and event.pressed and direction == Vector2.ZERO:
		direction = (event.global_position - global_position).normalized()
#func _ready():
#	Dialogic.start('wrath')
#	$CutsceneAudio.play()
#	Dialogic.connect('timeline_ended',dialogue_done)
#func dialogue_done():
#	can_move=true
#	$CutsceneAudio.stop()
#	Events.wrathstart.emit()
func _physics_process(delta):
	if can_move:
		look_at(get_global_mouse_position())
		self.velocity = direction * speed
		move_and_slide()
		if is_on_wall() or is_on_floor() or is_on_ceiling():
			direction = Vector2.ZERO


