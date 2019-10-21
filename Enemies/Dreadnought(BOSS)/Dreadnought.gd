extends KinematicBody2D
var ammno = preload("res://Enemies/Dreadnought(BOSS)/Ammno.tscn")

var i = 0
var numT = 3


func _on_Timer_timeout():
	var turrets = $Turrets.get_children()
	if i==numT:
		i=0
	turrets[i].shoot()
	i+=1
	pass # Replace with function body.







