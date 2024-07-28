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
	
	page.set_frame(Global.manual_page)
	change_labels()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func change_labels():
	
	$title_base.visible = false
	$mercury.visible = false
	$tin.visible = false
	$gold.visible = false
	$copper.visible = false
	$iron.visible = false
	$title_enhancer.visible = false
	$lithium.visible = false
	$lime.visible = false
	$brick.visible = false
	$magnesium.visible = false
	$oropimente.visible = false
	$title_flavour.visible = false
	$honey.visible = false
	$hops.visible = false
	$ginger.visible = false
	$cinnamon.visible = false
	
	match Global.manual_page+1:
	
		1:
			$title_base.visible = true
			$mercury.visible = true
			$tin.visible = true
			$gold.visible = true
			$copper.visible = true
			$iron.visible = true
		2:
			$title_enhancer.visible = true
			$lithium.visible = true
			$lime.visible = true
			$brick.visible = true
			$magnesium.visible = true
			$oropimente.visible = true
		3:
			$title_flavour.visible = true
			$honey.visible = true
			$hops.visible = true
			$ginger.visible = true
			$cinnamon.visible = true

func _on_close_pressed():
	get_tree().change_scene_to_file("res://scenes/game.tscn");

func _on_pass_page_pressed():
	
	if(Global.manual_page < page.sprite_frames.get_frame_count("default") - 1):
		Global.manual_page += 1
		page.set_frame(Global.manual_page)
		change_labels()

func _on_back_page_pressed():
	
	if(Global.manual_page > 0):
		Global.manual_page -= 1
		page.set_frame(Global.manual_page)
		change_labels()
	



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
