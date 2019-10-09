extends Node2D

func _physics_process(delta):
	var sons = get_children()
	for i in sons:
		if i.is_in_group("gravity"):
			print(i.position)
			var speed = Vector2(1,1).rotated(get_angle_to(i.position))
			i.position.x -= speed.x
			i.position.y -= speed.y