extends Node

class_name HUD

signal play_again

func on_play_again():
	$Outcome.visible = false
	$Snap.play()
	emit_signal("play_again")


func render_outcome(img: Texture2D, draw: bool = false):
	$Outcome.visible = true
	$Outcome/Draw.visible = draw
	$Outcome/Victory.visible = not draw
	if not draw:
		$Outcome/Victory/Player.set_texture(img)


func on_turn_swap(img: Texture2D):
	$PlayerSprite.set_texture(img)
