extends Sprite


func _physics_process(delta):
	rotation_degrees = rotation_degrees +(800*delta)
