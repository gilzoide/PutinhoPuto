
extends TextureFrame

var contMortes

func _ready():
	var contMortes = get_node('/root/ContMortes/').get_mortes ()
	var imagem = ImageTexture.new()
	if contMortes == 0:
		imagem.load ('res://SELO33.png')
	elif contMortes > 6:
		imagem.load ('res://SELONOOB.png')
	else:
		imagem.load ('res://SELO.png')
	set_texture(imagem)
	get_node("Mortes").set_text('Você morreu ' + str (contMortes) + ' vezes')
	set_process_input(true)

func _input(event):
	if event.is_action("ui_accept"):
		get_tree().quit ()
