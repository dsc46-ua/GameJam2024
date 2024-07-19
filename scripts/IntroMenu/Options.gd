extends Control

var music = AudioServer.get_bus_index("Music")
func _ready():
	$MarginContainer/VBoxContainer/Volume.value=db_to_linear(music)

func _on_back_pressed():
	get_tree().change_scene_to_file("res://MainMenu.tscn")

func _on_volume_value_changed(value):
	AudioServer.set_bus_volume_db(music,linear_to_db(value))

func _on_resolution_item_selected(index):
	match index:
		0:
			DisplayServer.window_set_size(Vector2i(1920,1080))
		1:
			DisplayServer.window_set_size(Vector2i(1600,900))
		2:
			DisplayServer.window_set_size(Vector2i(1280,720))
