extends KinematicBody2D

const GRAVITY = -100
const MAX_SPEED = 2000
const MOVE_SPEED = 400
const FRICTION_GROUND = 0.85
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


func _physics_process(delta):
	
	if move_mode ==1:
		velocity.x =MOVE_SPEED
	else:
		velocity.x =-MOVE_SPEED
		
	velocity.y -= GRAVITY
	
	if jump == true:
		velocity.y-=JUMP_FORCE
		jump=false
		print("heya")
	
	print(velocity.y)
	velocity=move_and_slide(velocity,Vector2.UP)
