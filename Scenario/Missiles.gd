extends Node
var children
func _ready():
	children = get_children()
func _on_shooter_timeout():
	return
	for i in children:
		if i.name != "shooter" and i.name != "one2":
			i._on_shooter_timeout()
	pass 


func _on_one2_body_entered(body):
	if body.name == "Ship":
		for i in children:
			if i.name != "shooter" and i.name != "one2":
				print("YY")
				i.active = true
				$one2.queue_free()
	pass 