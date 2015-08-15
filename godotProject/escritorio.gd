
extends Node2D

# A história
var Historia = preload ("res://historia.gd")
var historia

func _ready():
	historia = Historia.new ()
	set_process_input (true)

func _input(event):
	if event.is_action ("ui_accept") and event.is_pressed ():
		get_node ("PonteiroHora").me_gire ()

# Botão que toca um morse
func _on_Play_pressed ():
	get_node ("Perguntas/SamplePlayer").tocaFrase (historia.get_atual ()['mensagem'])

func _on_TextEdit_text_changed():
	pass
