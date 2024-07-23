extends Node2D

@onready var page = $full_manual
@onready var close: Sprite2D = $close/close_sprite
@onready var pass_page: Sprite2D = $pass_page/pass_sprite
@onready var back_page: Sprite2D = $back_page/back_page_sprite

func highlight(image):
	image.set_modulate(Color(0, 1, 1, 1))

func unhighlight(image):
	image.set_modulate(Color(1, 1, 1, 1))

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


func _on_pass_page_mouse_entered():
	highlight(pass_page)

func _on_pass_page_mouse_exited():
	unhighlight(pass_page)

func _on_back_page_mouse_entered():
	highlight(back_page)

func _on_back_page_mouse_exited():
	unhighlight(back_page)

func _on_close_mouse_entered():
	highlight(close)

func _on_close_mouse_exited():
	unhighlight(close)
