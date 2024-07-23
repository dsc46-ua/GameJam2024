extends Sprite2D

@onready var filling = $Filling
@onready var color = $Filling
@onready var col = Color("White")

# Called when the node enters the scene tree for the first time.
func _ready():
	filling.play("fill")
	match Global.ing1:
		1:
			col = Color(1,0,0,1)
		2:
			col = Color(0.752941, 0.752941, 0.752941, 1)
		3:
			col = Color(1, 0.843137, 0, 1)
		4:
			col = Color(0, 0, 1, 1)
		5:
			col = Color(0.647059, 0.164706, 0.164706, 1)
	match Global.ing2:
		6:
			col = col.lightened(0.8)
		7:
			col = col.lightened(0.4)
		8:
			col = col.darkened(0.6)
		9:
			col = col.lightened(0.2)
		10:
			col = col.darkened(0.3)
	match Global.ing3:
		11:
			color.modulate = Color(col)
		12:
			color.modulate = Color(col)
		13:
			color.modulate = Color(col)
		14:
			color.modulate = Color(col)
			
	



func _on_filling_animation_finished():
	if filling.animation == "fill":
		filling.play("full")

