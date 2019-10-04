extends Label

var points:int = 0

func _update(p):
	points +=p
	text = str(points)