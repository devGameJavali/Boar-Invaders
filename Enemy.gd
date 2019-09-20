extends KinematicBody2D
var move:Vector2 = Vector2(0,0)
func _ready():
	$Tween.interpolate_property(self,"position",position,position+move,0.1,Tween.TRANS_LINEAR,Tween.EASE_IN)

func _on_mover_timeout():
	move.x = randi()%50
	print(move)
	if int(move.x)%2 ==0:
		move.x = -move.x
		$Tween.interpolate_property(self,"position",position,position+move,0.1,Tween.TRANS_LINEAR,Tween.EASE_IN)
		$Tween.start()
	else:
		$Tween.start()
		$Tween.interpolate_property(self,"position",position,position+move,0.1,Tween.TRANS_LINEAR,Tween.EASE_IN)
	print(position)


func _on_Area2D_body_entered(body):
	print(body.group)
	if body.is_in_group("bullet"):
		$"..".numE -=1
		queue_free()
		$"..".points += 1
	pass # Replace with function body.


func _on_Area2D_area_entered(area):
	if area.is_in_group("bullet"):
		queue_free()
		$"..".points += 1
	pass # Replace with function body.
