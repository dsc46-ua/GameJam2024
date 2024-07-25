extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$fade.play("Fade in")
	await get_tree().create_timer(3).timeout
	$fadeRect.modulate = Color(0, 0, 0, 0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	get_tree().change_scene_to_file("res://scenes/MainMenu.tscn")
