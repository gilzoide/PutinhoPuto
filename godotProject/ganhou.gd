
extends TextureFrame

var contMortes

func _ready():
	print (get_node('/root/ContMortes/').get_mortes ())
	set_process_input(true)

func _input(event):
	get_tree().quit ()
