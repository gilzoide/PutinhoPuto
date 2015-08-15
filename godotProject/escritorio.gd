
extends Node2D


export var ponteiroRotationSpeed = -0.5


func _ready():
	set_process (true)

func _process(delta):
	get_node ("PonteiroHora").rotate (ponteiroRotationSpeed * delta)

