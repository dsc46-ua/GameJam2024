extends Control

func _on_play_pressed():
	get_tree().change_scene_to_file("res://scenes/tutorial.tscn")
	Global.change_music = true
	Global.bool_playing = true

func _on_options_pressed():
	get_tree().change_scene_to_file("res://scenes/Options.tscn")

func _on_quit_pressed():
	get_tree().quit()


func _on_credits_pressed():
	get_tree().change_scene_to_file("res://scenes/Credits.tscn")
