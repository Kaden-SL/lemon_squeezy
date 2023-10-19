extends Area2D
func _on_body_entered(body):
	if body.is_in_group("Player"):
		
		var current_scene_file = get_tree().current_scene.scene_file_path
		var current_scene_number = current_scene_file.to_int()
		print(current_scene_number)
		if current_scene_number == 10:
			var next_level_path = "res://02-Lust/Level/level_1.tscn"
			get_tree(). change_scene_to_file(next_level_path)
		elif current_scene_number == 21:
			var next_level_path = "res://02-Lust/Level/level_2.tscn"
			get_tree(). change_scene_to_file(next_level_path)
		elif current_scene_number == 22:
			var next_level_path = "res://04-Greed/Level/greed.tscn"
			get_tree(). change_scene_to_file(next_level_path)
		elif current_scene_number == 5:
			var next_level_path = "res://06-Heresy/Level/heresy.tscn"
			get_tree(). change_scene_to_file(next_level_path)
		
