extends Node2D

@onready var storage: Sprite2D = $go_storage/go_storage_sprite

func highlight(image):
	image.set_modulate(Color(0, 1, 1, 1))

func unhighlight(image):
	image.set_modulate(Color(1, 1, 1, 1))

# Called when the node enters the scene tree for the first time.
func _ready():
	$ColorRect.modulate = Color(0,0,0,0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_go_storage_mouse_entered():
	highlight(storage)

func _on_go_storage_mouse_exited():
	unhighlight(storage)

func _on_go_storage_pressed():
	get_tree().change_scene_to_file("res://scenes/storage.tscn")

func _on_maquina_button_pressed():
	if Global.bool_quieto and $"Vase/Filling".animation == "default" and Global.bool_conversacion:
		if Global.ing1 != 0 and Global.ing2 != 0 and Global.ing3 != 0:
			Global.bool_fade = false
			$"Vase/Filling".play("fill")
			Global.bool_quieto = false

func puntuar_pocion() -> void:
	# rango ingredieeentes
	if  (1 > Global.ing1 or Global.ing1 > 14) or (1 > Global.ing2 or Global.ing2 > 14) or (1 > Global.ing3 or Global.ing3 > 14):
		print("Error: Los índices deben estar entre 1 y 14.")
		return
	
	var suma = Global.puntuacion[Global.ing1 - 1] + Global.puntuacion[Global.ing2 - 1] + Global.puntuacion[Global.ing3 - 1]
	var sufijo: String = ""
	if suma >= 0 and suma <= 24:
		sufijo = "_angry"
	elif suma >= 25 and suma <= 49:
		sufijo = "_neutral"
	elif suma >= 50:
		sufijo = "_happy"
	
	var animacion: String = Global.character + sufijo
	#CUIDADOOOO NO VAAAAA
	$Personaje/Personaje.play(animacion)
