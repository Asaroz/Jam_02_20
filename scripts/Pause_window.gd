extends Popup


func _ready():
	popup()
	set_global_position(get_parent().get_parent().global_position)

func _physics_process(delta):
	var pausemode = get_node("/root/Singleton")
	if Input.is_action_just_pressed("pause"):
		
		popup()
		set_global_position(get_parent().get_parent().global_position)
		pausemode.pausemode = pausemode.pausemode * -1
	if pausemode.pausemode == -1: 
		get_tree().paused=true
	else:
		get_tree().paused=false
		hide()

