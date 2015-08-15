
extends VBoxContainer

export var up_speed = 1

func _ready():
	set_process_input (true)

# hora que clicar, bora pro escritório
func _input(event):
	if event.is_action ("ui_accept"):
		vaiProEscritorio ()

# hora que a animação acabar, bora pro escritório
func _on_AnimationPlayer_finished():
	vaiProEscritorio ()

func vaiProEscritorio ():
	get_tree ().change_scene ("res://escritorio.scn")
