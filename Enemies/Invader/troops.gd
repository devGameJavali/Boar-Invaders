extends Node2D

var ship = preload("res://Enemies/Invader/Invader.tscn")
var size = Vector2(6,3)
var idList:Array = []
func _ready():
	spawn_squad()
	
func spawn_squad():
	var start_pos= 64 * size.x
	for i in range(0,size.x):
		idList.append([])
		for j in range(0,size.y):
			idList[i-1].append(1)
			_spawn(i,j)
	


func _on_reTimer_timeout():
	$reTimer.wait_time = $reTimer.wait_time -0.1
	var action = randi()%4
	if action<10:
		for i in range(0,size.x):
			for j in range(0,size.y):
				if idList[i][j] == 0:
					idList[i][j] =1 
					print(i,j)
					_spawn(i,j)
					return
	pass # Replace with function body.
	
func _spawn(x,y):
	var start_pos= 64 * size.x
	print("replenishing..........")
	var troop = ship.instance()
	add_child(troop)
	troop.position = Vector2(-start_pos+(x+1)*2*64,0+(y+1)*2*64)
	troop.name = "I"+str(x,y)
	troop.set_id(x,y)
