
extends Sprite

# 30 graus a cada hora
export var ponteiroRotationSpeed = -deg2rad (30)

func _ready():
	erig_em ()

# Gira o ponteiro em 1 hora
func me_gire ():
	rotate (ponteiroRotationSpeed)

# Gira o ponteiro 1 hora pra trás
func erig_em ():
	rotate(-ponteiroRotationSpeed)
