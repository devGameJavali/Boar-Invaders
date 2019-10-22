extends KinematicBody2D

func damage(dam):
	if $"..".armor<1:
		queue_free()
		for i in $"../Turrets".get_children():
			i.add_to_group("body")
			i.get_child(1).disabled = false
		return false
	$"..".armor-=dam
	
	print(true)
	return true