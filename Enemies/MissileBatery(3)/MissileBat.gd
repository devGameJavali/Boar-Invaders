extends StaticBody2D
var life = 3
var missile = preload("res://Enemies/MissileBatery(3)/Missile.tscn")
func damage():
	life -= 1
	if life < 1:
		queue_free()
		return true
	return false
func _on_shooter_timeout():
	var rocket = missile.instance()
	get_node("..").add_child(rocket)
	rocket.start(get_global_transform(),$"../Ship")
	pass # Replace with function body."."
