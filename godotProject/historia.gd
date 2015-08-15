
extends Reference

const NADA = 0
const MORTE = 1
const MANDAR_MSG = 2

# Lista de passos da história
var historia = [
	{
		mensagem = 'TUDOMANEHAHA',
		B1 = '"Eles chamaram vocês de manés. Haha"',
		R1 = MORTE,
		B2 = '"Eles são perigosos"',
		R2 = "ELES SÃO UNS MANEZÕES!",
		B3 = "Omitir",
		R3 = NADA
	},
	{
		mensagem = 'GUARDATROCA19H',
		B1 = '"Os inimigos sabem da hora da troca dos guardas"',
		R1 = 'ENTÃO VOCÊ ESTÁ NOS CAGUETANDO?!',
		B2 = 'Omitir',
		R2 = NADA,
		B3 = 'Dançar cara-caramba-cara-cara-ô',
		R3 = 'TÁ MALUCO? FOCA NO TRABALHO!'
	},
	{
		mensagem = 'BOMBA16H',
		B1 = '"Haverá uma bomba às 16h"',
		R1 = 'CRETINOS, ELES VÃO VER!',
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
		R2 = 'MORFÉTICOS, ELES VERÃO!',
		B3 = '"Eles estarão vulneráveis às 19h"',
		R3 = 'AHA, SE FODERAM'
	},
	{
		mensagem = 'MATARTODOS',
		B1 = '"Eles falaram que vão matar todo mundo"',
		R1 = 'VÃO COISÍSSIMA NENHUMA!',
		B2 = 'Omitir',
		R2 = MORTE,
		B3 = '"Eles estão tomando chá com biscoitos"',
		R3 = MORTE
	},
	{
		mensagem = 'COMUNICACAOABERTA'
	}
]