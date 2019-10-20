extends Node2D

onready var block:PackedScene = preload("res://Scenario/Elements/Wall/Block.tscn")
export var dime:Vector2 = Vector2(10,10) 

func _ready():
	for i in range(1,dime.x+1):
		for j in range(1,dime.y+1):
			var blocked = block.instance()
			add_child(blocked)
			blocked.position = Vector2(-20+(i*20),-20+(j*20))