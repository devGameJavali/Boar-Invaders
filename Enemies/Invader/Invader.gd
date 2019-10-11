extends enemy


func _ready():
	life = 3
	root = "../../.."


func _on_shoot_timeout():
	var action = randi()%12
	if action ==4:
		shoot($cL.get_global_transform()[2],root)
		shoot($cR.get_global_transform()[2],root)
		shoot($cM.get_global_transform()[2],root)
	pass # Replace with function body.

	
func _on_Timer_timeout():
	$shoot.start()
	pass # Replace with function body.


func _leftFire(s):
	if s == 1:
		$fireL.show()
func _rightFire(s):
	if s == 1:
		$fireR.show()
		
func _hideFire():
	$fireR.hide()
	$fireL.hide()