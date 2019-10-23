extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_one2_area_entered(area):
	
	pass # Replace with function body.


func _on_one2_body_entered(body):
	print("now")
	if body.name=="Ship":
		for i in get_children():
			i.active = true
	pass # Replace with function body.
