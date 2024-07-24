extends Node2D

@onready var ing1 = 0
@onready var ing2 = 0
@onready var ing3 = 0

#Overall score
@onready var score = 0

#Controls on which scene we are
@onready var currentScene = 0

#Controls that there is not any repetition of the entry
@onready var showEntryAnimation = true
@onready var showExitAnimation = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
