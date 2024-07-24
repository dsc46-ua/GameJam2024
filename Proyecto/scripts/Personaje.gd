extends CharacterBody2D

@onready var character : AnimatedSprite2D = $Personaje
@onready var movement : AnimationPlayer = $movement_player

#Selection of the character and their entry

func _ready():
	#Here it is the order of the characters
	match(Global.currentScene):
		0:
			character.play("witch_neutral")
		1:
			character.play("goblin_neutral")
		2:
			character.play("one_eye_neutral")
		3:
			character.play("pickle_eye_neutral")
		4:
			character.play("witch_neutral")
		5:
			character.play("buffed_guy_neutral")

	characterAnimation()
	$Button.visibility_changed

func characterAnimation():
	#To make the character entry
	if(Global.showEntryAnimation):
		movement.play("entrar")
		Global.showEntryAnimation = false
	
	if(Global.showExitAnimation):
		movement.play("salir") 
		Global.showEntryAnimation = true
		Global.showExitAnimation = false
		Global.currentScene += 1

func _on_animation_player_animation_finished(entrar):
	movement.play("quieto")
	Global.bool_quieto = true

func _on_button_button_up():
	if movement.current_animation == "quieto":
		DialogueManager.show_example_dialogue_balloon(load("res://dialogue/main.dialogue"), "start")





