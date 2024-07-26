extends CharacterBody2D

@onready var character : AnimatedSprite2D = $Personaje
@onready var movement : AnimationPlayer = $movement_player
@onready var dialogue_controller_first = false
@onready var dialogue_controller_second = false

func _ready():
	#Here it is the order of the characters
	$"../tutorial_manual".modulate = Color(1, 1, 1, 0)
	characterAnimation()
	$Button.visibility_changed

func _process(delta):
		character.play("tutorial_guy")
		if Global.barro:
			if Global.cambiar_animacion:
					movement.play("salir")
					Global.barro = false
					await get_tree().create_timer(6).timeout
					Global.barro = true
					characterAnimation()
					Global.cambiar_animacion = false
					Global.showEntryAnimation = true
					get_tree().change_scene_to_file("res://scenes/game.tscn")
		
		if(Global.tutorial_pass_part):	
			$"../tutorial_manual".modulate = Color(1, 1, 1, 0)

func characterAnimation():
	#To make the character entry
		movement.play("entrar")
		movement.queue("quieto")
		movement.queue("salir")

func _on_movement_player_animation_changed(old_name, new_name):
	if movement.current_animation == "quieto":
		Global.bool_quieto = true
	if movement.current_animation == "salir":
		Global.bool_quieto = false

func _on_button_button_up():
	$"../tutorial_manual".modulate = Color(1, 1, 1, 0)
	if Global.bool_quieto and movement.current_animation != "salir":
		
		if(!dialogue_controller_first):
			dialogue_controller_first = true
			DialogueManager.show_example_dialogue_balloon(load("res://dialogue/main.dialogue"), "tutorial_p0")
			
		if(Global.tutorial_pass_part and !dialogue_controller_second):
			dialogue_controller_second = true
			$"../tutorial_manual".modulate = Color(1, 1, 1, 1)
			Global.tutorial_pass_part = false
			DialogueManager.show_example_dialogue_balloon(load("res://dialogue/main.dialogue"), "tutorial_p1")
			
			
		if(Global.tutorial_pass_part):
			
			DialogueManager.show_example_dialogue_balloon(load("res://dialogue/main.dialogue"), "tutorial_p2")


