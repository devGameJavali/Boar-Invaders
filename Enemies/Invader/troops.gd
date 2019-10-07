extends Node2D

var ship = preload("res://Enemies/Invader/Invader.tscn")
var size = Vector2(7,1)
var idList:Array = []
func _ready():
	spawn_squad()
	
func spawn_squad():
	for i in range(0,size.x):
		idList.append([])
		for j in range(0,size.y):
			idList[i].append(1)
			_spawn(i,j)
	


func _on_reTimer_timeout():
	var action = randi()%4
	if action==2:
		for i in range(0,size.x):
			for j in range(0,size.y):
				if idList[i][j] == 0:
					idList[i][j] =1 
					_spawn(i,j)
					if $reTimer.wait_time>0.5:
						$reTimer.wait_time = $reTimer.wait_time -0.1
					return
	pass # Replace with function body.
	
func _spawn(x,y):
	var start_pos= 102 * size.x
	var troop = ship.instance()
	add_child(troop)
	troop.position = Vector2(-start_pos+(x+1)*2*110,0+(y+1)*2*83)
	troop.name = "I"+str(x,y)
	troop.set_id(x,y)
