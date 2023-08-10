extends Node2D

var _curr_player = Game.Occupant.X
var img_x = preload("res://graphics/x.svg")
var img_o = preload("res://graphics/o.svg")

var imgs = {
	Game.Occupant.X: img_x,
	Game.Occupant.O: img_o
}

func _on_space_pressed(s: Space):
	s.occupy(imgs[_curr_player], _curr_player)
	_curr_player = Game.Occupant.O if _curr_player == Game.Occupant.X else Game.Occupant.X


func _ready():
	pass
