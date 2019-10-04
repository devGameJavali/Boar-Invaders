extends Node2D
var move:int = 32
var act:int = 1
var side:int = 0 #0=right 1=left
func lTween():
	$Tween.interpolate_property(self,"position",position,Vector2(position.x-move,position.y),0.3,Tween.TRANS_CUBIC,Tween.EASE_IN)                                             
	$Tween.start()
func rTween():
	$Tween.interpolate_property(self,"position",position,Vector2(position.x+move,position.y),0.3,Tween.TRANS_CUBIC,Tween.EASE_IN)     
	$Tween.start()
func dTween():
	$Tween.interpolate_property(self,"position",position,Vector2(position.x,position.y+move),0.3,Tween.TRANS_CUBIC,Tween.EASE_IN)     
	$Tween.start()
	
   

func _on_actionTimer_timeout():
	if act%16 == 0:
		dTween()
		if side ==0:
			side=1
		elif side ==1:
			side = 0
		act-=15
		return
	elif side == 0:
		rTween()
	elif side ==1:
		lTween()
	act+=1
	pass # Replace with function body.
