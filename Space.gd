extends TextureButton

class_name Space

signal space_pressed

@export var ord: int
@export var occupant = Game.Occupant.EMPTY

func occupy(img, occ: Game.Occupant):
	$ImgHousing.texture = img
	occupant = occ
	

func _pressed():
	if occupant == Game.Occupant.EMPTY:
		emit_signal("space_pressed", self)
