extends enemy
var active = true

func _ready():
	life = 3
	root = "../../.."


func _on_shoot_timeout():
	if active ==false:
		return
	var action = randi()%10
	if action ==4:
		#shoot($cL.global_position,root)
		#shoot($cR.global_position,root)
		shoot($cM.global_position,root)
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

func _on_VisibilityNotifier2D_screen_entered():
	print("activing")
	active = true
	pass # Replace with function body.


func _on_VisibilityNotifier2D_screen_exited():
	print("des")
	active = false
	pass # Replace with function body.
