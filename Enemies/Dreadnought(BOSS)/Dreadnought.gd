extends Node2D
var ammno = preload("res://Enemies/Dreadnought(BOSS)/Ammno.tscn")
var turret = preload("res://Enemies/Dreadnought(BOSS)/Turret1.tscn")
var armor = 20
var life = 100

var i = 0
var T = [1,1,1]

func _physics_process(delta):
	position.y+=-0.3
func _ready():
	$Node2D/TextureProgress.max_value = life
	$Node2D/TextureProgress.value = life
func _on_Timer_timeout():
	var turrets = $Turrets.get_children()
	var numT = $Turrets.get_child_count()
	if numT==0:
		return
	if i>=numT:
		i=0
	turrets[i].shoot()
	i+=1
	pass # Replace with function body.



func _on_Capital_body_entered(body):
	if body.name == "LaserBullet":
		body.queue_free()
		life-=2
		$"Node2D/TextureProgress".value = life
		if life<1:
			queue_free()
			
	pass # Replace with function body.


func _on_Respawn_timeout():
	for i in range(3):
		print(T)
		if T[i] == 0:
			T[i] = 1
			match i:
				0:
					_respawn(Vector2(0,-230),1)
				1:
					_respawn(Vector2(0,-105),2)
				2:
					_respawn(Vector2(0,295),3)
	pass # Replace with function body.
	
func _respawn(pos,index):
	var newTur = turret.instance()
	get_node("Turrets").add_child(newTur)
	newTur.position = pos
	newTur.name = "Turret"+str(index)
	newTur.id = index
	
