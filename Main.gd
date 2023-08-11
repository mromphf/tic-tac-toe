extends Node2D

var _curr_player = Game.Occupant.X
var img_x = preload("res://graphics/x.svg")
var img_o = preload("res://graphics/o.svg")
var winner = "Winner! {p}"
var spaces = [] 

var targets = [
	[1, 2, 3],
	[4, 5, 6],
	[7, 8, 9],
	[1, 4, 7],
	[2, 5, 8],
	[3, 6, 9],
	[1, 5, 9],
	[3, 5, 9]
]

var imgs = {
	Game.Occupant.X: img_x,
	Game.Occupant.O: img_o
}

func _board_full():
	return spaces.all(func(s: Space): return s.is_occupied())

func _on_space_pressed(s: Space):
	s.occupy(imgs[_curr_player], _curr_player)
	
	for t in targets:
		if spaces.filter(func(s: Space): return s.ord in t) \
			.all(func(s: Space): return s.occupant == _curr_player):
				print(winner.format({
					"p": _curr_player
				}))
	
	if _board_full():
		print("Draw!")
		
	_curr_player = Game.Occupant.O if _curr_player == Game.Occupant.X \
		else Game.Occupant.X


func _ready():
	spaces = $Container.get_children()
