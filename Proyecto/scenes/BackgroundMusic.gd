extends AudioStreamPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	self.stream = load("res://assets/sounds/BSO_darktender_main_menu.wav")
	self.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Global.change_music):
		self.stream = load("res://assets/sounds/BSO_darktender_main_theme.wav")
		self.play()
		Global.change_music = false
	if (Global.change_music2):
		self.stream = load("res://assets/sounds/BSO_darktender_main_menu.wav")
		self.play()
		Global.change_music2 = false
