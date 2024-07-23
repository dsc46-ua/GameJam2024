extends CharacterBody2D

func _ready():
	$AnimationPlayer.play("entrar")
	$Button.visibility_changed

func _on_animation_player_animation_finished(entrar):
	$AnimationPlayer.play("quieto")

func _on_button_button_up():
	if $AnimationPlayer.current_animation == "quieto":
		DialogueManager.show_example_dialogue_balloon(load("res://dialogue/main.dialogue"), "start")

