
extends Node

var esta_tocando = -1



func toca (index):
	if index == esta_tocando and get_child(index).is_playing():
		get_child (index).stop ()
	else:
		get_child(index).play()
		esta_tocando = index
	