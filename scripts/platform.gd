extends Node2D

const IDLE_DURATION = 1.0
var istriggered= 0
var move_to=Vector2.ZERO
export var speed = 3.0
export var trigger = 0


onready var tween =$MoveTween
onready var platform =$Platform

func _ready():
	if trigger==0:
		_init_tween()

func _init_tween():
	move_to = Vector2(get_node("moveto").position)
	var duraction = move_to.length() / float(speed * 16)
	tween.interpolate_property(platform,"position", Vector2.ZERO,move_to,duraction,Tween.TRANS_LINEAR,Tween.EASE_IN,IDLE_DURATION)
	tween.interpolate_property(platform,"position", move_to,Vector2.ZERO,duraction,Tween.TRANS_LINEAR,Tween.EASE_IN,duraction+IDLE_DURATION*2)
	tween.start()


func _on_Hitbox_area_entered(area):
	if trigger==1 and area.is_in_group("Player") and istriggered==0:
		istriggered=1
		_init_tween()
	if move_to.y <0:
		get_parent().get_node("Player").velocity.y = (get_parent().get_node("Player").velocity.y)*2



