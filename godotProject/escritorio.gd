
extends Node2D

var historia

func _ready():
	historia = get_node ("Historia")

func _on_Play_pressed():
	get_node("ZZZ").hide()
	get_node ("Perguntas/Play/Morse").toca (historia.get_atual_index ())

func _on_Enter_pressed():
	# pega mensagem da caixa de texto, normalizada
	var mensagemUsuario = get_node("Perguntas/Caixa").get_text().to_upper()
	var atual = historia.get_atual()
	
	# se acertou, abre respostas
	if mensagemUsuario == atual['mensagem']:
		# esconde as perguntas e o dicionário
		get_node("Dicionario").hide()
		get_node("Perguntas").hide()
		# mostra as respostas atualizadas
		var resps = get_node("Respostas")
		resps.get_node("B1").set_text('1)' + atual['B1'])
		resps.get_node("B2").set_text('2)' + atual['B2'])
		resps.get_node("B3").set_text('3)' + atual['B3'])
		resps.show()
	

# toggle na ajuda
func _on_BotaoAjuda_pressed():
	var ajuda = get_node("Ajuda")
	if ajuda.is_hidden():
		ajuda.show()
	else:
		ajuda.hide()

# Respondeu 1
func _on_B1_pressed():
	historia.responde ('R1')
# Respondeu 2
func _on_B2_pressed():
	historia.responde ('R2')
# Respondeu 3
func _on_B3_pressed():
	historia.responde ('R3')
