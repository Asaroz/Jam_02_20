extends Timer

export var hold = 0

func _on_Timer_timeout():
	yield(get_tree().create_timer(hold),"timeout")
	var barrel_resource = preload("res://scenes/Barrel.tscn")
	var barrel = barrel_resource.instance()
	var spawnpoint = Vector2.ZERO

	spawnpoint=get_node("spawnposition").position
		
	barrel.set_position(spawnpoint)
	get_parent().add_child(barrel)
	
