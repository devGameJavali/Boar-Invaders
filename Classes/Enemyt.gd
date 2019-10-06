extends StaticBody2D
class_name enemy
var bul = preload("res://Enemies/Invader/ene_bull.tscn")
var id
var root
func shoot(pos,father):
	root = father
	var shoot = bul.instance()
	get_node(father).add_child(shoot)
	shoot.position = pos
	shoot.set_angle(rotation)
func set_id(x,y):
	id = Vector2(x,y)
func die():
	if name == "Invader":
			$"..".idList[id.x][id.y] = 0
	queue_free()