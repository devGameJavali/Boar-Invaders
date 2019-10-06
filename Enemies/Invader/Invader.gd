extends enemy


func _ready():
	root = "../../.."


func _on_shoot_timeout():
	var p = get_global_transform()[2]
	var action = randi()%12
	if action ==4:
		shoot($cL.get_global_transform()[2],root)
		shoot($cR.get_global_transform()[2],root)
		shoot($cM.get_global_transform()[2],root)
	pass # Replace with function body.

	
func _on_Timer_timeout():
	$shoot.start()
	pass # Replace with function body.
