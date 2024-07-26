extends CharacterBody2D

@onready var character : AnimatedSprite2D = $Personaje
@onready var movement : AnimationPlayer = $movement_player

#Selection of the character and their entry

func _ready():
	#Here it is the order of the characters\
	change_char()
	$Button.visibility_changed

func change_char():
	match(Global.currentScene):
		0:
			Global.animacion = "witch_neutral"
			Global.character = "witch"
		1:
			if Global.bool_quieto:
				Global.animacion = "goblin_stand"
			else:
				Global.animacion = "goblin_neutral"
			Global.character = "goblin"
		2:
			Global.animacion = "one_eye_neutral"
			Global.character = "one_eye"
		3:
			Global.animacion = "pickle_neutral"
			Global.character = "pickle"
		4:
			Global.animacion = "witch2_neutral"
			Global.character = "witch2"
		5:
			Global.animacion = "buffed_guy_neutral"
			Global.character = "buffed_guy"
		6: 
			if (Global.cont_bien - Global.cont_mal) >= 0:
				get_tree().change_scene_to_file("res://scenes/good_ending.tscn")
			else:
				get_tree().change_scene_to_file("res://scenes/bad_ending.tscn")
	characterAnimation()

func _process(delta):
		character.play(Global.animacion)
		if Global.barro:
			if Global.cambiar_animacion:
				movement.play("salir")
				#BARRO EN TI CONFIO
				Global.barro = false
				await get_tree().create_timer(6).timeout
				Global.barro = true
				Global.currentScene += 1
				Global.cambiar_animacion = false
				Global.showEntryAnimation = true
				change_char()
			
	
func characterAnimation():
	#To make the character entry
	if(Global.showEntryAnimation):
		movement.play("entrar")
		movement.queue("quieto")
		movement.queue("salir")
		movement.queue("entrar")
		Global.showEntryAnimation = false

func _on_movement_player_animation_changed(old_name, new_name):
	if movement.current_animation == "quieto":
		if Global.character == "goblin":
			Global.animacion = "goblin_stand"
		Global.bool_quieto = true
	if movement.current_animation == "salir":
		Global.bool_quieto = false

func _on_button_button_up():
	if Global.bool_quieto and Global.bool_fade:
		match character.animation:
			"witch_neutral":
				DialogueManager.show_example_dialogue_balloon(load("res://dialogue/main.dialogue"), "witch")
			"goblin_stand":
				DialogueManager.show_example_dialogue_balloon(load("res://dialogue/main.dialogue"), "goblin")
			"one_eye_neutral":
				DialogueManager.show_example_dialogue_balloon(load("res://dialogue/main.dialogue"), "one_eye")
			"pickle_neutral":
				DialogueManager.show_example_dialogue_balloon(load("res://dialogue/main.dialogue"), "pickle")
			"witch2_neutral":
				DialogueManager.show_example_dialogue_balloon(load("res://dialogue/main.dialogue"), "witch2")
			"buffed_guy_neutral":
				DialogueManager.show_example_dialogue_balloon(load("res://dialogue/main.dialogue"), "buffed_guy")



