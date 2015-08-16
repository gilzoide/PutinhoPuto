
extends Node

const NADA = 0
const MORTE = 1
const GENERAL = 2
const MANDAR_MSG = 3
const MORRE_PROXIMA = 4
const VIVEU = 5

# Lista de passos da história
var historia = [
	{
		mensagem = 'TUDOMANEHAHA',
		B1 = '"Eles chamaram vocês de manés. Haha"',
		R1 = MORTE,
		R1msg = 'General não gostou',
		B2 = '"Eles são perigosos"',
		R2 = GENERAL,
		R2msg = "ELES SÃO UNS MANEZÕES!",
		B3 = "Omitir",
		R3 = NADA
	},
	{
		mensagem = 'GUARDATROCA19H',
		B1 = '"Eles sabem da hora da troca dos guardas"',
		R1 = GENERAL,
		R1msg = 'ENTÃO VOCÊ ESTÁ NOS CAGUETANDO?!',
		B2 = 'Omitir',
		R2 = NADA,
		B3 = 'Dançar cara-caramba-cara-cara-ô',
		R3 = GENERAL,
		R3msg = 'TÁ MALUCO? FOCA NO TRABALHO!'
	},
	{
		mensagem = 'BOMBA16H',
		B1 = '"Haverá uma bomba às 16h"',
		R1 = GENERAL,
		R1msg = 'CRETINOS, ELES VÃO VER!',
		B2 = '"Haverá uma bomba às 17h"',
		R2 = MORTE,
		R2msg = 'Não estavam preparados a tempo',
		B3 = 'Omitir',
		R3 = MORTE,
		R3msg = 'A bomba veio'
	},
	{
		mensagem = 'INVASAO20H',
		B1 = 'Omitir',
		R1 = MORTE,
		R1msg = 'A invasão veio',
		B2 = '"Eles vão invadir às 20h"',
		R2 = GENERAL,
		R2msg = 'MORFÉTICOS, ELES VERÃO!',
		B3 = '"Eles estarão vulneráveis às 19h"',
		R3 = GENERAL,
		R3msg = 'AHA, SE FODERAM'
	},
	{
		mensagem = 'MATARTODOS',
		B1 = '"Eles falaram que vão matar todo mundo"',
		R1 = GENERAL,
		R1msg = 'VÃO COISÍSSIMA NENHUMA!',
		B2 = 'Omitir',
		R2 = MORTE,
		R2msg = 'Eles mataram todos',
		B3 = '"Eles estão tomando chá com biscoitos"',
		R3 = MORTE,
		R3msg = 'General não gosta de piadas'
	},
	{
		mensagem = 'COMUNICACAOABERTA',
		B1 = '"Eles disseram que a comunicao esta aberta"',
		R1 = MORTE,
		R1msg = 'General acha que você é x9',
		B2 = 'Omitir',
		R2 = MORRE_PROXIMA,
		B3 = '"Mandar mensagem para o inimigo"',
		R3 = MANDAR_MSG
	},
	{
		mensagem = 'PEGAMOSVOCES',
		B1 = '"Eles falaram que nos pegaram"',
		R1 = MORTE,
		R1msg = 'E pegaram mesmo',
		B2 = 'Comemorar',
		R2 = MORTE,
		R2msg = 'General te matou',
		B3 = 'Omitir',
		R3 = VIVEU
	}
]

# Pedaço atual da história
var atual = 5
# flag, se tá na penúltima e omitiu
var vou_morrer = false
# dicionário auxiliar pra última fase se `vou_morrer'
var morreu_na_ultima = {}

# Pega a historinha atual
func get_atual():
	return historia[atual]

# Pega índice da historinha atual
func get_atual_index ():
	if atual < historia.size():
		return atual
	else:
		return -1

# Responde R1, R2 ou R3
func responde (resp):
	var hist = historia[atual]
	# na última, se omitiu
	if vou_morrer:
		var porta = get_node('../PortaAberta')
		porta.get_node("Perdeu/Label").set_text('Inimigo te matou')
		porta.show ()
		morreu_na_ultima[resp] = true
		# se já morreu em todas, volta
		if morreu_na_ultima.has('R1') and morreu_na_ultima.has('R2') and morreu_na_ultima.has('R3'):
			vou_morrer = false
			atual -= 2
			get_node('../PonteiroHora').erig_em ()
			get_node('../PonteiroHora').erig_em ()
		else:
			return
	# vai morrer
	elif hist[resp] == MORTE:
		var porta = get_node('../PortaAberta')
		porta.get_node("Perdeu/Label").set_text(hist[resp + 'msg'] + '\nVOCÊ MORREU')
		porta.show ()
		get_node('/root/ContMortes').incMorte ()
		return
	# general reclamão
	elif hist[resp] == GENERAL:
		var general = get_node('../General')
		general.get_node("Label").set_text(hist[resp + 'msg'])
		general.show ()
	elif hist[resp] == MANDAR_MSG:
		get_node('../Respostas').hide()
		var perguntas = get_node('../Perguntas')
		perguntas.get_node("Caixa").set_text('')
		perguntas.get_node("Enter").connect("pressed", self, 'mandouMensagem')
		perguntas.show()
		return
	# ih, fodeu, na próxima já era
	elif hist[resp] == MORRE_PROXIMA:
		vou_morrer = true
	# ganhou!
	elif hist[resp] == VIVEU:
		var porta = get_node('../PortaAberta')
		var imagem = ImageTexture.new()
		imagem.load('res://SUPER FLANGO.png')
		porta.get_node("Perdeu/Cara").set_texture(imagem)
		porta.get_node("Perdeu/Label").set_text('SUPER FLANGO TE SALVOU\nE TE DEU UM PASTEL')
		porta.show()
	else:
		get_node("../ZZZ").show()
	proxima ()

# Vai pra próxima iteração da história
func proxima ():
	atual += 1
	get_node('../Respostas').hide()
	get_node('../Perguntas').show()
	# andou uma hora
	get_node('../PonteiroHora').me_gire ()
	# limpa a caixa de texto
	get_node('../Perguntas/Caixa').set_text('')

# Callback de mandar mensagem
func mandouMensagem():
	var msg = get_node('../Perguntas/Caixa').get_text().to_upper()
	# easter eggs
	if msg == 'EASTEREGG':
		vaiOvoEuEscolhoVoce('EGG')
	elif msg == 'GGERETSAE':
		vaiOvoEuEscolhoVoce('GGE')
	elif msg == 'PICCARO':
		vaiOvoEuEscolhoVoce('PICCARO')
	elif msg == 'PUTAO':
		vaiOvoEuEscolhoVoce('PUTAO')
	# não mandou SOS, morre diabo!
	if msg != 'SOS':
		vou_morrer = true
	# desconecta callback
	get_node('../Perguntas/Enter').disconnect("pressed", self, 'mandouMensagem')
	proxima()

func vaiOvoEuEscolhoVoce (nomePng):
	var ovo = get_node('../Ovo')
	var imagem = ImageTexture.new()
	imagem.load ('res://' + nomePng + '.png')
	ovo.set_normal_texture(imagem)
	ovo.show()