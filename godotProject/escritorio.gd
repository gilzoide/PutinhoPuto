
extends Node2D



func _ready():
	#set_process (true)
	set_process_input (true)

func _input(event):
	if event.is_action ("ui_accept") and event.is_pressed ():
		get_node ("PonteiroHora").me_gire ()

