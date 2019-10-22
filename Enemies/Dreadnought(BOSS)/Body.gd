extends KinematicBody2D

func damage(dam):
	if $"..".armor<1:
		collision_layer -= 32
		collision_mask -= 32
		for i in $"../Turrets".get_children():
			i.add_to_group("body")
			i.get_child(1).disabled = false
		return false
	$"..".armor-=dam
	
	print(true)
	return true