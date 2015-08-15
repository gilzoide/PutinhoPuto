
extends Sprite

# 30 graus a cada hora
export var ponteiroRotationSpeed = -deg2rad (30)

# Gira o ponteiro em 1 hora
func me_gire ():
	rotate (ponteiroRotationSpeed)
