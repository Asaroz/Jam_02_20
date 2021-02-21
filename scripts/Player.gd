extends KinematicBody2D

const GRAVITY = -50
const MOVE_SPEED = 250
const JUMP_FORCE = 800

var jumpwasPressed = false
var coyote_time = true
var direction=0
var velocity= Vector2.ZERO
var move_mode = 1
var jump=false
var button_check = true



func _ready():
	pass # Replace with function body.


func _input(event):
	if event.is_action_pressed("change"):
		move_mode= move_mode*-1
	if event.is_action_pressed("restart"):
		get_tree().reload_current_scene()
		if get_parent().name=="world_1":
			Singleton.timer = 0


func _physics_process(_delta):

	if is_on_floor():
		if jumpwasPressed:
			velocity.y-=JUMP_FORCE
		else:
			if Input.is_action_just_pressed("jump"):
				velocity.y-=JUMP_FORCE
		coyote_time =true
		
	if is_on_floor()==false:
			coyotetime()
			if  Input.is_action_just_pressed("jump"):
				jumpwasPressed=true
				rememberJumptime()
	
	if velocity.x==0 and is_on_floor():
		move_mode=move_mode*-1
	if move_mode ==1:
		velocity.x =MOVE_SPEED
	else:
		velocity.x =-MOVE_SPEED
	velocity.y -= GRAVITY


	
	velocity=move_and_slide(velocity,Vector2.UP)
	find_node("UI").find_node("Label").rect_position.x = global_position.x+400
	find_node("UI").find_node("Label").rect_position.y = global_position.y-280
	find_node("UI").find_node("Label").text= "Death:  "+ str(Singleton.playerdeath)
	find_node("UI").find_node("Time").rect_position.x = global_position.x+400
	find_node("UI").find_node("Time").rect_position.y = global_position.y-260
	find_node("UI").find_node("Time").text= "Time:  "+ str(Singleton.timer)
	
	

func _on_Hurtbox_area_entered(area):
	if area.is_in_group("flag"):
		get_tree().change_scene("res://worlds/world_" + str(int(get_tree().current_scene.name)+1)+".tscn")
	if area.is_in_group("enemy"):
		Singleton.playerdeath = Singleton.playerdeath +1
		get_tree().reload_current_scene()
	if area.is_in_group("button"):
		if button_check:
			get_parent().get_node("Gate-Button").get_node("Gate").get_node("Hitbox").queue_free()
			get_parent().get_node("Gate-Button").get_node("Gate").get_node("ani_sprite").queue_free()
			button_check=false

func coyotetime():
	yield(get_tree().create_timer(0.2),"timeout")
	coyote_time = false

func rememberJumptime():
	yield(get_tree().create_timer(0.2),"timeout")
	jumpwasPressed = false
	
