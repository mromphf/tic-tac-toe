extends Node

class_name HUD

signal play_again

func on_play_again():
	$VictorC.visible = false
	$Label.visible = true
	$Img.visible = true
	emit_signal("play_again")


func on_victory(img: Texture2D):
	$VictorC.visible = true
	$VictorC/VictorImg.texture = img
	$Label.visible = false
	$Img.visible = false
	

func on_draw():
	$Draw.visible = true

func on_turn_swap(img: Texture2D):
	$Img.texture = img
