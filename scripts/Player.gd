extends KinematicBody2D

const GRAVITY = -100
const MOVE_SPEED = 400
const JUMP_FORCE = 1500

var direction=0
var velocity= Vector2.ZERO
var move_mode =1
var jump=false

func _ready():
	pass # Replace with function body.


func _input(event):
	if event.is_action_pressed("change"):
		move_mode= move_mode*-1
	if event.is_action_pressed("jump") and is_on_floor():
		jump=true


func _physics_process(_delta):

	
	if velocity.x==0:
		move_mode=move_mode*-1
	if move_mode ==1:
		velocity.x =MOVE_SPEED
	else:
		velocity.x =-MOVE_SPEED
		
	if jump == true:
		velocity.y-=JUMP_FORCE
		jump=false
		
	velocity.y -= GRAVITY
	var stop=0
	stop = Input.get_action_strength("stop")
	
	if stop==1:
		velocity.x=0
		move_mode=move_mode*-1
	velocity=move_and_slide(velocity,Vector2.UP)
	

func _on_Hurtbox_area_entered(area):
	if area.is_in_group("flag"):
		get_tree().change_scene("res://worlds/world_" + str(int(get_tree().current_scene.name)+1)+".tscn")
	if area.is_in_group("enemy"):
		get_tree().reload_current_scene()
