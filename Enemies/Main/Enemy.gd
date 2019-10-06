extends KinematicBody2D
var move:Vector2 = Vector2(0,0)
var animSpeed:float = 0.15

func _on_mover_timeout():
	var movement = randi()%50
	if int(move.x)%4 ==0:
		move.x = movement
		move.y = 0
	elif int(move.x)%4 ==1:
		move.x = -movement
		move.y =0
		_move()
	elif int(move.x)%4 ==2:
		move.y = movement/4
		move.x=0
		_move()
	else:
		move.y = -movement/4
		move.x=0
		_move()

func _move():
	$Tween.start()
	$Tween.interpolate_property(self,"position",position,position+move,animSpeed,Tween.TRANS_LINEAR,Tween.EASE_IN)

func _on_Area2D_body_entered(body):
	if body.is_in_group("bullet"):
		body.queue_free()
		$"..".numE -=1
		queue_free()
		$"..".points += 1
	pass # Replace with function body.
