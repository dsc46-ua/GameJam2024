extends Control

var music_bus = AudioServer.get_bus_index("Music")

func _ready():
	# Ajustar la barra de volumen con el valor global
	$MarginContainer/VBoxContainer/Volume.value = Global.volume

func _on_back_pressed():
	if (Global.bool_playing):
		get_tree().change_scene_to_file("res://scenes/game.tscn")
	else :
		get_tree().change_scene_to_file("res://scenes/MainMenu.tscn")

func _on_volume_value_changed(value):
	# Actualizar la variable global y el volumen del bus de audio
	Global.volume = value
	AudioServer.set_bus_volume_db(music_bus, linear_to_db(value))

func _on_resolution_item_selected(index):
	match index:
		0:
			DisplayServer.window_set_size(Vector2i(1920,1080))
		1:
			DisplayServer.window_set_size(Vector2i(1600,900))
		2:
			DisplayServer.window_set_size(Vector2i(1280,720))

func _on_check_button_toggled(toggled_on):
	if toggled_on == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
