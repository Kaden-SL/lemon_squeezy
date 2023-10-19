extends Node2D

@onready var point = $Demon/Pointer
@onready var mark = $Damien/Marker
@onready var flinch = $Demon/AnimationPlayer
@onready var shock = $Damien/AnimationPlayer
@onready var attack = $Choice/Attack
@onready var defend = $Choice/Defend
@onready var proceed = $Button

var current_player_health = 0
var current_enemy_health = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	set_health($"Demon/Health Bar", demon_state.current_health, demon_state.max_health)
	set_health($"Damien/Health Bar", human_state.current_health, human_state.max_health)
	
	current_player_health = human_state.current_health
	current_enemy_health = demon_state.current_health
	
	defend.disabled = false

func set_health(progress_bar, health, max_health):
	progress_bar.value = health
	progress_bar.max_value = max_health

func focus():
	point.show()

func unfocus():
	point.hide()

func recoil(): 
	flinch.play("hurt")

func waver():
	shock.play("hurt")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_attack_pressed():
	attack.disabled = true
	defend.disabled = true
	
	focus()
	await get_tree().create_timer(1).timeout
	recoil()
	unfocus()
	
	current_enemy_health = max(0, current_enemy_health - human_state.damage)
	set_health($"Demon/Health Bar", current_enemy_health, demon_state.max_health)
	
	await get_tree().create_timer(2).timeout
	
	if current_enemy_health == 0:
		end_combat()
	else:
		attack.disabled = false
		defend.disabled = false
		enemy_turn()

func enemy_turn():
	waver()
	current_player_health = max(0, current_player_health - demon_state.damage)
	set_health($"Damien/Health Bar", current_player_health, human_state.max_health)
	if current_player_health == 0:
		end_combat()
	else:
		attack.disabled = false
		defend.disabled = false

func _on_defend_pressed():
	attack.disabled = true
	defend.disabled = true
	
	mark.show()
	await get_tree().create_timer(1).timeout
	mark.hide()
	
	defending_turn()

func defending_turn():
	waver()
	
	current_player_health = max(0, current_player_health - (demon_state.damage / 2))
	set_health($"Damien/Health Bar", current_player_health, human_state.max_health)
	
	if current_player_health == 0:
		end_combat()
	else:
		attack.disabled = false
		defend.disabled = false

func end_combat():
	attack.disabled = true
	defend.disabled = true
	proceed.visible = true

func _on_button_pressed():
	get_tree().change_scene_to_file("res://07-Violence/Levels/epilogue.tscn")
