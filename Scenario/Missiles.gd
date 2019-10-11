extends Node
var children
func _ready():
	children = get_children()
func _on_shooter_timeout():
	for i in children:
		if i.name != "shooter":
			i._on_shooter_timeout()
	pass 
