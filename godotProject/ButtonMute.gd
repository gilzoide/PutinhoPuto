
extends Button

# está mudo?
var is_mute = false

func _pressed():
	is_mute = get_node ('../Perguntas/Play/Morse').toggleMute ()
	var text = ImageTexture.new ()
	if is_mute:
		text.load('res://AUDIOOFF.png')
	else:
		text.load('res://AUDIOON.png')
	set_button_icon(text)
