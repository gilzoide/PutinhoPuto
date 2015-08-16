
extends Node

const NADA = 0
const MORTE = 1
const GENERAL = 2
const MANDAR_MSG = 3
const VIVEU = 4

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
		B1 = '"Os inimigos sabem da hora da troca dos guardas"',
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
		B3 = 'Omitir',
		R3 = MORTE
	},
	{
		mensagem = 'INVASAO20H',
		B1 = 'Omitir',
		R1 = MORTE,
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
		B3 = '"Eles estão tomando chá com biscoitos"',
		R3 = MORTE
	},
	{
		mensagem = 'COMUNICACAOABERTA',
		B1 = '"Eles disseram que a comunicao esta aberta"',
		R1 = MORTE,
		B2 = 'Omitir',
		R2 = MORTE,
		B3 = '"Mandar mensagem para o inimigo"',
		R3 = MANDAR_MSG
	},
	{
		mensagem = 'PEGAMOSVOCES',
		B1 = '"Eles falaram que nos pegaram"',
		R1 = MORTE,
		B2 = 'Comemorar',
		R2 = MORTE,
		B3 = 'Omitir',
		R3 = VIVEU
	}
]

var atual = 0

# Pega a historinha atual
func get_atual():
	return historia[atual]

# Pega índice da historinha atual
func get_atual_index ():
	return atual

# Responde R1, R2 ou R3
func responde (resp):
	var hist = historia[atual]
	if hist[resp] == MORTE:
		var porta = get_node('../PortaAberta')
		porta.get_node("Perdeu/Label").set_text(hist[resp + 'msg'] + '\nVOCÊ MORREU')
		porta.show ()
		return
	elif hist[resp] == GENERAL:
		var general = get_node('../General')
		general.get_node("Label").set_text(hist[resp + 'msg'])
		general.show ()
	elif hist[resp] == VIVEU:
		get_tree ().change_scene ('res://ganhou.scn')
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
