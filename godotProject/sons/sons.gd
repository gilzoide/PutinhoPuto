
extends Node

# Guarda qual faixa está tocando, pra podermos parar
var esta_tocando = -1
# Tem volume? 1 ou 0
var volume

func toca (index):
	# se tá tocando ainda, para
	if index == esta_tocando and get_child(index).is_playing():
		get_child (index).stop ()
		esta_tocando = -1
	else:
		get_child(index).play()
		esta_tocando = index
	atualizaVolume ()

# atualiza o volume, se tá tocando ou não
func atualizaVolume ():
	if esta_tocando == -1:
		get_node("fundo").set_volume(volume)
	else:
		get_node("fundo").set_volume(volume / 10)

func toggleMute ():
	if volume == 0:
		volume = 1
	else:
		volume = 0
	atualizaVolume ()
	# retorna se tá mudo ou não
	return volume == 0