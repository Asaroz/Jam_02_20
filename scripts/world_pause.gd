extends Node2D

func _ready():
	get_tree().paused=false

func _input(event):
	if event.is_action_pressed("pause"):
		get_tree().paused=false
