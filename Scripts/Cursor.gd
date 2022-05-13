extends Sprite

func _process(delta):
	if Globals.currentItem==-1:
		set_texture(null)
	else:
		#return
		if get_texture()!=Globals.items[Globals.currentItem][2]:
			set_texture(Globals.items[Globals.currentItem][2])
	print (Globals.currentItem)
