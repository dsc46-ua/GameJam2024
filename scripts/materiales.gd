extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
# Función para restablecer las animaciones de todos los nodos excepto uno
func reset_animations(exclude_node: Node):
	var nodes = ["ing1-1", "ing1-2", "ing1-3", "ing1-4", "ing1-5"]
	for node_name in nodes:
		var node = get_node(node_name)
		if node != exclude_node and node.animation == "marcado":
			node.play("default")

# Función para cambiar la animación del nodo y restablecer las demás
func change_animation_and_reset(node_name: String):
	var node = get_node(node_name)
	node.play("marcado")
	reset_animations(node)


func _on_button_1_pressed():
	change_animation_and_reset("ing1-1")

func _on_button_2_pressed():
	change_animation_and_reset("ing1-2")

func _on_button_3_pressed():
	change_animation_and_reset("ing1-3")

func _on_button_4_pressed():
	change_animation_and_reset("ing1-4")

func _on_button_5_pressed():
	change_animation_and_reset("ing1-5")
