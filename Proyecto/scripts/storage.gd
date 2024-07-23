extends Node2D

@onready var back: Sprite2D = $go_back/go_back_sprite

@onready var mercurio: AnimatedSprite2D = $mercurio/mercurio_image
@onready var mercurio_name: Label = $mercurio/name
@onready var mercurio_type: Label = $mercurio/type

@onready var estanyo: AnimatedSprite2D = $estanyo/estanyo_image
@onready var estanyo_name: Label = $estanyo/name
@onready var estanyo_type: Label = $estanyo/type

@onready var oro: AnimatedSprite2D = $oro/oro_image
@onready var oro_name: Label = $oro/name
@onready var oro_type: Label = $oro/type

@onready var cobre: AnimatedSprite2D = $cobre/cobre_image
@onready var cobre_name: Label = $cobre/name
@onready var cobre_type: Label = $cobre/type

@onready var hierro: AnimatedSprite2D = $hierro/hierro_image
@onready var hierro_name: Label = $hierro/name
@onready var hierro_type: Label = $hierro/type

@onready var litio: AnimatedSprite2D = $litio/litio_image
@onready var litio_name: Label = $litio/name
@onready var litio_type: Label = $litio/type

@onready var cal: AnimatedSprite2D = $cal/cal_image
@onready var cal_name: Label = $cal/name
@onready var cal_type: Label = $cal/type

@onready var ladrillo: AnimatedSprite2D = $ladrillo/ladrillo_image
@onready var ladrillo_name: Label = $ladrillo/name
@onready var ladrillo_type: Label = $ladrillo/type

@onready var magnesio: AnimatedSprite2D = $magnesio/magnesio_image
@onready var magnesio_name: Label = $magnesio/name
@onready var magnesio_type: Label = $magnesio/type

@onready var oropimente: AnimatedSprite2D = $oropimente/oropimente_image
@onready var oropimente_name: Label = $oropimente/name
@onready var oropimente_type: Label = $oropimente/type

@onready var miel: AnimatedSprite2D = $miel/miel_image
@onready var miel_name: Label = $miel/name
@onready var miel_type: Label = $miel/type

@onready var lupulo: AnimatedSprite2D = $lupulo/lupulo_image
@onready var lupulo_name: Label = $lupulo/name
@onready var lupulo_type: Label = $lupulo/type

@onready var jengibre: AnimatedSprite2D = $jengibre/jengibre_image
@onready var jengibre_name: Label = $jengibre/name
@onready var jengibre_type: Label = $jengibre/type

@onready var canela: AnimatedSprite2D = $canela/canela_image
@onready var canela_name: Label = $canela/name
@onready var canela_type: Label = $canela/type

var isHighlited = false
var isLabelShowed = false
var isBaseSelected = false
var isEnhancerSelected = false
var isFlavourSelected = false

func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

#Auxiliar functions

func highlight(image):
	if(!isHighlited):
		image.set_modulate(Color(0, 1, 1, 1))
		isHighlited = true

func unhighlight(image):
	image.set_modulate(Color(1, 1, 1, 1))
	isHighlited = false

func showLabel(name, type):
	if(!isLabelShowed):
		name.visible = true
		type.visible = true
		isLabelShowed = true

func hideLabel(name, type):
	name.visible = false
	type.visible = false
	isLabelShowed = false

#Funcion que resetea todas las bases

func reset_base(type: String):
	
	match type:
		"base":
	
			mercurio.play("default")
			estanyo.play("default")
			oro.play("default")
			cobre.play("default")
			hierro.play("default")
			isBaseSelected = false
	
		"enhancer":
			
			litio.play("default")
			cal.play("default")
			ladrillo.play("default")
			magnesio.play("default")
			oropimente.play("default")
			isEnhancerSelected = false
	
		"flavour":
			
			miel.play("default")
			lupulo.play("default")
			jengibre.play("default")
			canela.play("default")

#Cambia el sprite si se selecciona un ingrediente

func select_sprite(image, type: String):
	
	match type:
		"base":
			
			if(isBaseSelected):
				reset_base(type)
			isBaseSelected = true
		
		"enhancer":
			
			if(isEnhancerSelected):
				reset_base(type)
			isEnhancerSelected = true
		
		"flavour":
			
			if(isFlavourSelected):
				reset_base(type)
			isFlavourSelected = true
		
	image.play("marcado")


#Signals
func _on_go_back_mouse_entered():
	highlight(back)


func _on_go_back_mouse_exited():
	unhighlight(back)

func _on_mercurio_button_pressed():
	select_sprite(mercurio, "base")

func _on_mercurio_button_mouse_entered():
	highlight(mercurio)
	showLabel(mercurio_name, mercurio_type)

func _on_mercurio_button_mouse_exited():
	unhighlight(mercurio)
	hideLabel(mercurio_name, mercurio_type)

func _on_estanyo_button_pressed():
	select_sprite(estanyo, "base")

func _on_estanyo_button_mouse_entered():
	highlight(estanyo)
	showLabel(estanyo_name, estanyo_type)

func _on_estanyo_button_mouse_exited():
	unhighlight(estanyo)
	hideLabel(estanyo_name, estanyo_type)

func _on_oro_button_pressed():
	select_sprite(oro, "base")

func _on_oro_button_mouse_entered():
	highlight(oro)
	showLabel(oro_name, oro_type)

func _on_oro_button_mouse_exited():
	unhighlight(oro)
	hideLabel(oro_name, oro_type)

func _on_cobre_button_pressed():
	select_sprite(cobre, "base")

func _on_cobre_button_mouse_entered():
	highlight(cobre)
	showLabel(cobre_name, cobre_type)

func _on_cobre_button_mouse_exited():
	unhighlight(cobre)
	hideLabel(cobre_name, cobre_type)

func _on_hierro_button_pressed():
	select_sprite(hierro, "base")

func _on_hierro_button_mouse_entered():
	highlight(hierro)
	showLabel(hierro_name, hierro_type)

func _on_hierro_button_mouse_exited():
	unhighlight(hierro)
	hideLabel(hierro_name, hierro_type)

func _on_litio_button_pressed():
	select_sprite(litio, "enhancer")

func _on_litio_button_mouse_entered():
	highlight(litio)
	showLabel(litio_name, litio_type)

func _on_litio_button_mouse_exited():
	unhighlight(litio)
	hideLabel(litio_name, litio_type)

func _on_cal_button_pressed():
	select_sprite(cal, "enhancer")

func _on_cal_button_mouse_entered():
	highlight(cal)
	showLabel(cal_name, cal_type)

func _on_cal_button_mouse_exited():
	unhighlight(cal)
	hideLabel(cal_name, cal_type)

func _on_magnesio_button_pressed():
	select_sprite(magnesio, "enhancer")

func _on_magnesio_button_mouse_entered():
	highlight(magnesio)
	showLabel(magnesio_name, magnesio_type)

func _on_magnesio_button_mouse_exited():
	unhighlight(magnesio)
	hideLabel(magnesio_name, magnesio_type)

func _on_ladrillo_button_pressed():
	select_sprite(ladrillo, "enhancer")

func _on_ladrillo_button_mouse_entered():
	highlight(ladrillo)
	showLabel(ladrillo_name, ladrillo_type)

func _on_ladrillo_button_mouse_exited():
	unhighlight(ladrillo)
	hideLabel(ladrillo_name, ladrillo_type)

func _on_oropimente_button_pressed():
	select_sprite(oropimente, "enhancer")

func _on_oropimente_button_mouse_entered():
	highlight(oropimente)
	showLabel(oropimente_name, oropimente_type)

func _on_oropimente_button_mouse_exited():
	unhighlight(oropimente)
	hideLabel(oropimente_name, oropimente_type)

func _on_miel_button_pressed():
	select_sprite(miel, "flavour")

func _on_miel_button_mouse_entered():
	highlight(miel)
	showLabel(miel_name, miel_type)

func _on_miel_button_mouse_exited():
	unhighlight(miel)
	hideLabel(miel_name, miel_type)

func _on_lupulo_button_pressed():
	select_sprite(lupulo, "flavour")

func _on_lupulo_button_mouse_entered():
	highlight(lupulo)
	showLabel(lupulo_name, lupulo_type)

func _on_lupulo_button_mouse_exited():
	unhighlight(lupulo)
	hideLabel(lupulo_name, lupulo_type)

func _on_jengibre_button_pressed():
	select_sprite(jengibre, "flavour")

func _on_jengibre_button_mouse_entered():
	highlight(jengibre)
	showLabel(jengibre_name, jengibre_type)

func _on_jengibre_button_mouse_exited():
	unhighlight(jengibre)
	hideLabel(jengibre_name, jengibre_type)

func _on_canela_button_pressed():
		select_sprite(canela, "flavour")

func _on_canela_button_mouse_entered():
	highlight(canela)
	showLabel(canela_name, canela_type)

func _on_canela_button_mouse_exited():
	unhighlight(canela)
	hideLabel(canela_name, canela_type)


func _on_go_back_pressed():
	get_tree().change_scene_to_file("res://scenes/game.tscn")
