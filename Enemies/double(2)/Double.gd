extends enemy
var sttRot
var shoot_state = false

func _ready():
	sttRot = rotation_degrees
	root = ".."
	$Tween.interpolate_property(self,"rotation_degrees",rotation_degrees,rotation_degrees+90,1.0,Tween.TRANS_LINEAR,Tween.EASE_IN_OUT)
	$Tween.start()
func _on_shoot_timeout():
	if shoot_state == true:
		shoot($cL.get_global_transform()[2],root)
		shoot($cR.get_global_transform()[2],root)
	pass # Replace with function body.


func _on_Tween_tween_completed(object, key):
	if int(rotation_degrees) ==90+round(sttRot):
		$Tween.interpolate_property(self,"rotation_degrees",rotation_degrees,rotation_degrees-180,2.0,Tween.TRANS_LINEAR,Tween.EASE_IN_OUT)
		$Tween.start()
	else:
		$Tween.interpolate_property(self,"rotation_degrees",rotation_degrees,rotation_degrees+180,2.0,Tween.TRANS_LINEAR,Tween.EASE_IN_OUT)
		$Tween.start()
	pass # Replace with function body.


func _on_Shield_body_entered(body):
	if body.is_in_group("player") and body.is_in_group("bullet"):
		body.queue_free()

	pass # Replace with function body.


func _on_state_timeout():
	if shoot_state==false:
		shoot_state=true
	else:
		shoot_state=false
	pass # Replace with function body.
