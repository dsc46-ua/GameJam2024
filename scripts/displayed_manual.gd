extends Node2D

@onready var page = $full_manual

var current_frame = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	current_frame = page.get_frame()
	page.set_frame(current_frame)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_close_pressed():
	get_tree().change_scene_to_file("res://scenes/game.tscn");

func _on_pass_page_pressed():
	if(current_frame > 0):
		current_frame -= 1
		page.set_frame(current_frame)

func _on_back_page_pressed():
	if(current_frame < page.sprite_frames.get_frame_count("default") - 1):
		current_frame += 1
		page.set_frame(current_frame)
