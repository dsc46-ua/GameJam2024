extends Node2D

@onready var storage: Sprite2D = $go_storage/go_storage_sprite

func highlight(image):
	image.set_modulate(Color(0, 1, 1, 1))

func unhighlight(image):
	image.set_modulate(Color(1, 1, 1, 1))

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.bool_playing = true
	$ColorRect.modulate = Color(0,0,0,0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_go_storage_mouse_entered():
	highlight(storage)

func _on_go_storage_mouse_exited():
	unhighlight(storage)

func _on_go_storage_pressed():
	if Global.bool_quieto:
		get_tree().change_scene_to_file("res://scenes/storage.tscn")

func _on_maquina_button_pressed():
	if  $"Vase/Filling".animation == "default" and Global.bool_conversacion:
		if Global.ing1 != 0 and Global.ing2 != 0 and Global.ing3 != 0:
			Global.bool_fade = false
			$"Vase/Filling".play("fill")
			$pouring.play()
			Global.bool_quieto = false
#Global.bool_quieto and
func _on_options_button_pressed():
	if Global.bool_quieto:
		get_tree().change_scene_to_file("res://scenes/Options.tscn")

func _on_options_button_mouse_entered():
	$Options_button.modulate = Color(1, 1, 1, 0.5)

func _on_options_button_mouse_exited():
	$Options_button.modulate = Color(1, 1, 1, 1)

func puntuar_pocion() -> void:
	var suma = 0
	# rango ingredieeentes
	if  (1 > Global.ing1 or Global.ing1 > 14) or (1 > Global.ing2 or Global.ing2 > 14) or (1 > Global.ing3 or Global.ing3 > 14):
		print("Error: Los índices deben estar entre 1 y 14.")
		return

	if Global.currentScene == 5:
		if Global.ing2 == 6: 
			match Global.ing1:
				2:
					if Global.ing3 == 11:
						suma = 50
					else:
						suma = 25
				3:
					suma = 50
		if Global.ing2 == 10: 
			match Global.ing1:
				2:
					suma=25
				3:
					if Global.ing3 == 11:
						suma = 50
					else:
						suma = 25
	else:
		suma = Global.puntuacion[Global.ing1 - 1] + Global.puntuacion[Global.ing2 - 1] + Global.puntuacion[Global.ing3 - 1]
		if Global.ing2 == 6:
			suma = 0
	var sufijo: String = ""
	if suma >= 0 and suma <= 24:
		sufijo = "_angry"
		Global.cont_mal += 1
	elif suma >= 25 and suma <= 49:
		sufijo = "_neutral"
	elif suma >= 50:
		sufijo = "_happy"
		Global.cont_bien += 1
	Global.animacion = Global.character + sufijo
	if Global.character == "goblin":
		await get_tree().create_timer(3).timeout
		Global.animacion = "goblin_neutral"
