extends Node2D

@onready var volume: float = 1.0
@onready var ing1 = 0
@onready var ing2 = 0
@onready var ing3 = 0
@onready var puntuacion = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
@onready var character = "witch"
@onready var animacion = "none"
@onready var cambiar_animacion = false
@onready var tutorial_pass_part = false
@onready var barro = true
@onready var cont_bien = 0
@onready var cont_mal = 0
@onready var manual_page = 0


#Overall score
@onready var score = 0

#Controls on which scene we are
@onready var currentScene = 5

#Controls that there is not any repetition of the entry
@onready var showEntryAnimation = true
@onready var showExitAnimation = false
@onready var bool_quieto = false
@onready var bool_conversacion = false
@onready var bool_fade = true
@onready var bool_playing = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
