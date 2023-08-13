extends Node2D

var _curr_player = Game.Occupant.X
var img_x = preload("res://graphics/x.svg")
var img_o = preload("res://graphics/o.svg")
var targets = []
var in_progress = true


var imgs = {
	Game.Occupant.X: img_x,
	Game.Occupant.O: img_o
}

func _reset():
	in_progress = true
	_curr_player = Game.Occupant.X
	$HUD.on_turn_swap(imgs[_curr_player])
	
	
	for space in $Container.get_children():
		space.empty()

func _board_full():
	return $Container.get_children() \
		.all(func(s: Space): return s.is_occupied())
	
func _victory():
	return targets.any(func(group: Array): return \
		group.all(func(s: Space): return s.occupant == _curr_player))

func _on_space_pressed(s: Space):
	if in_progress:
		s.occupy(imgs[_curr_player], _curr_player)
		
		if _victory():
			in_progress = false
			$Applause.play()
			$Success.play()
			$HUD.render_outcome(imgs[_curr_player])

		elif _board_full():
			$HUD.render_outcome(imgs[_curr_player], true)
			$Draw.play()

		_curr_player = Game.Occupant.O if _curr_player == Game.Occupant.X \
			else Game.Occupant.X
		$HUD.on_turn_swap(imgs[_curr_player])


func _ready():
	$HUD.on_turn_swap(imgs[_curr_player])
	for space in $Container.get_children():
		space.connect("space_pressed", _on_space_pressed)
	
	targets = 	[	
		[$Container/TOP_RIGHT, $Container/TOP_CENTER, $Container/TOP_LEFT],
		[$Container/MID_RIGHT, $Container/MID_CENTER, $Container/MID_LEFT],
		[$Container/BOT_RIGHT, $Container/BOT_CENTER, $Container/BOT_LEFT],
		[$Container/TOP_RIGHT, $Container/MID_RIGHT, $Container/BOT_RIGHT],
		[$Container/TOP_CENTER, $Container/MID_CENTER, $Container/BOT_CENTER],
		[$Container/TOP_LEFT, $Container/MID_LEFT, $Container/BOT_LEFT],
		[$Container/TOP_RIGHT, $Container/MID_CENTER, $Container/BOT_LEFT],
		[$Container/TOP_LEFT, $Container/MID_CENTER, $Container/BOT_RIGHT]
	]
