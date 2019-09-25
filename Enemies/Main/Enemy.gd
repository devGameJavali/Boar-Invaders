extends KinematicBody2D
var move:Vector2 = Vector2(0,0)
var animSpeed:float = 0.15

func _on_mover_timeout():
	move.x = randi()%50
	if int(move.x)%2 ==0:
		move.x = -move.x
		_move()
	else:
		_move()


func _on_Area2D_area_entered(area):
	if area.is_in_group("bullet"):
		$"..".numE -=1
		print($"..")
		queue_free()
		$"..".points += 1
	pass # Replace with function body.

func _move():
	$Tween.start()
	$Tween.interpolate_property(self,"position",position,position+move,animSpeed,Tween.TRANS_LINEAR,Tween.EASE_IN)