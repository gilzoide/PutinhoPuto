
extends Node

# guarda qual faixa está tocando, pra podermos parar
var esta_tocando = -1

func toca (index):
	# se tá tocando ainda, para
	if index == esta_tocando and get_child(index).is_playing():
		get_child (index).stop ()
		get_node("fundo").set_volume(1)
	else:
		get_child(index).play()
		esta_tocando = index
		get_node("fundo").set_volume(0.1)
	