extends Control

@onready var label = $Label
@onready var audioTypewriter = $Typewriter
@onready var audioCaballo = $Caballo
@onready var audioCarga = $Carga

var frases = [
	"Roma exige lealtad",
	"Cassius Scaeva la juró",
	"Roma no recuerda promesas",
	"Solo necesita culpables."
]

var velocidad := 0.09

func _ready():
	mostrar_frases()

func mostrar_frases():
	for frase in frases:
		await escribir_texto(frase)
		await get_tree().create_timer(1.5).timeout
	
	# 🔻 limpiar texto → pantalla negra
	label.text = ""
	
	# 🔊 reproducir audios
	audioCaballo.play()
	await get_tree().create_timer(0.5).timeout # pequeño delay
	
	audioCarga.play()
	
	# ⏳ esperar que termine el momento
	await get_tree().create_timer(3.0).timeout
	
	cambiar_escena()

func escribir_texto(texto):
	label.text = ""
	
	for letra in texto:
		label.text += letra
		
		if letra != " ":
			audioTypewriter.play()
		
		await get_tree().create_timer(velocidad).timeout

func cambiar_escena():
	get_tree().change_scene_to_file("res://Escenas/nivel1.tscn")
