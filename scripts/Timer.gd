extends Timer


func _on_Timer_timeout():
	var rng = RandomNumberGenerator.new()
	var rock_resource = preload("res://scenes/Rock.tscn")
	var rock = rock_resource.instance()
	var spawnpoint = Vector2.ZERO
	
	spawnpoint= get_parent().get_node("Player").position
	spawnpoint.y= spawnpoint.y- 800
	rng.randomize()
	var my_random_number = rng.randf_range(-300.0, 300.0)
	spawnpoint.x= spawnpoint.x + my_random_number
		
	rock.set_position(spawnpoint)
	get_parent().add_child(rock)
	
