extends Node2D

@onready var storage: Sprite2D = $go_storage/go_storage_sprite

func highlight(image):
	image.set_modulate(Color(0, 1, 1, 1))

func unhighlight(image):
	image.set_modulate(Color(1, 1, 1, 1))

# Called when the node enters the scene tree for the first time.
func _ready():
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_go_storage_mouse_entered():
	highlight(storage)

func _on_go_storage_mouse_exited():
	unhighlight(storage)

func _on_go_storage_pressed():
	get_tree().change_scene_to_file("res://scenes/storage.tscn")
