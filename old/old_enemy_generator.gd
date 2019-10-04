extends Node2D

var enemy = preload("res://Enemies/Main/Enemy.tscn")
var numE = 0
var points = 0

func _process(delta):
	$Label2.text = str(points)
func _on_Spawner_timeout():
	print(numE)
	$Spawner.start()
	if numE<1000:
		var e = enemy.instance()
		add_child(e)
		e.position = Vector2(500,100)
		numE +=1
	pass # Replace with function body.


func _on_Timer_timeout():
	$Spawner.start()
	pass # Replace with function body.
