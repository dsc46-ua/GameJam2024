@tool
class_name manual extends Node2D
 
@export var manual_image: Sprite2D

@onready var base_manual: Sprite2D = $baseManualSprite

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func highlight():
	base_manual.set_modulate(Color(0, 1, 1, 1))

func unhighlight():
	base_manual.set_modulate(Color(1, 1, 1, 1))

func _on_button_pressed():
	get_tree().change_scene_to_file("res://scenes/displayed_manual.tscn")
	
func _on_button_mouse_entered():
	highlight()

func _on_button_mouse_exited():
	unhighlight()
