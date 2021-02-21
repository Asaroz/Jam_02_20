extends Timer


func _on_Playtime_timeout():
	Singleton.timer = Singleton.timer+0.1
