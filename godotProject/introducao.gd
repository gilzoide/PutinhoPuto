
extends Node2D

export var up_speed = 10

func _ready():
	set_process (true)

func _process (delta):
	translate (Vector2 (0, -up_speed * delta))
