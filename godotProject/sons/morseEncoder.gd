
extends SamplePlayer

const DOT = 0
const DASH = 1

var dic = {
	a = [DOT, DASH],
	b = [DASH, DOT, DOT, DOT],
	c = [DASH, DOT, DASH, DOT],
	d = [DASH, DOT, DOT],
	e = [DOT],
	f = [DOT, DOT, DASH, DOT],
	g = [DASH, DASH, DOT],
	h = [DOT, DOT, DOT, DOT],
	i = [DOT, DOT],
	j = [DOT, DASH, DASH, DASH],
	k = [DASH, DOT, DASH],
	l = [DOT, DASH, DOT, DOT],
	m = [DASH, DASH],
	n = [DASH, DOT],
	o = [DASH, DASH, DASH],
	p = [DOT, DASH, DASH, DOT],
	q = [DASH, DASH, DOT, DASH],
	r = [DOT, DASH, DOT],
	s = [DOT, DOT, DOT],
	t = [DOT],
	u = [DOT, DOT, DASH],
	v = [DOT, DOT, DOT, DASH],
	w = [DOT, DASH, DASH],
	x = [DASH, DOT, DOT, DASH],
	y = [DASH, DOT, DASH, DASH],
	z = [DASH, DASH, DOT, DOT],
	'1' : [DOT, DASH, DASH, DASH, DASH],
	'2' : [DOT, DOT, DASH, DASH, DASH],
	'3' : [DOT, DOT, DOT, DASH, DASH],
	'4' : [DOT, DOT, DOT, DOT, DASH],
	'5' : [DOT, DOT, DOT, DOT, DOT],
	'6' : [DASH, DOT, DOT, DOT, DOT],
	'7' : [DASH, DASH, DOT, DOT, DOT],
	'8' : [DASH, DASH, DASH, DOT, DOT],
	'9' : [DASH, DASH, DASH, DASH, DOT],
	'0' : [DASH, DASH, DASH, DASH, DASH]
}


func _ready():
	tocaLetra('6')

func tocaEspera (nome):
	play (nome)
	# Espera acabar (feião, mas...)
	while is_active():
		pass

func tocaLetra(letra):
	var vetor = dic[letra]
	
	for toque in vetor:
		if toque == DASH:
			tocaEspera("dash")
		else:
			tocaEspera("dot")
		tocaEspera("bip gap")
	tocaEspera("letter gap")
	
func tocaFrase(frase):
	pass
	for letra in frase:
		tocaLetra(letra)