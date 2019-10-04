extends Label

var life:int = 40

func _update(l):
	life +=l
	text = str(life)