extends TextureButton

class_name Space

signal space_pressed

@export var ord: int
@export var occupant = Game.Occupant.EMPTY

func empty():
	$ImgHousing.texture = null
	occupant = Game.Occupant.EMPTY

func is_occupied():
	return occupant != Game.Occupant.EMPTY


func occupy(img: Texture2D, occ: Game.Occupant):
	$ImgHousing.texture = img
	occupant = occ
	

func _pressed():
	if occupant == Game.Occupant.EMPTY:
		emit_signal("space_pressed", self)
