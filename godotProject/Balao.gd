
extends TextureButton

func _pressed():
	if get_node('../Historia').get_atual_index () == -1:
		get_tree().change_scene('res://ganhou.scn')
	else:
		hide ()
