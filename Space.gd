extends TextureButton

class_name Space

@export var ord: int
@export var occupant = Game.Occupants.EMPTY

func _pressed():
	print(ord)
