extends StaticBody2D
var bul = preload("res://Enemies/Invader/ene_bull.tscn")
var id

func _on_shoot_timeout():
	var action = randi()%12
	if action == 2:
		var shoot = bul.instance()
		get_node("../../..").add_child(shoot)
		shoot.position = get_global_transform()[2]
	pass # Replace with function body.

func _on_Timer_timeout():
	$shoot.start()
	pass # Replace with function body.
	
func set_id(x,y):
	id = Vector2(x,y)


func die():
	$"..".idList[id.x][id.y] = 0
	queue_free()