extends Node



func hit_play():
	$Hit.play()

func flag_play():
	$Flag.play()

func jump_play():
	$Jump.play()

func Button_play():
	$Button.play()


func _on_Background_finished():
	$Background.play()
