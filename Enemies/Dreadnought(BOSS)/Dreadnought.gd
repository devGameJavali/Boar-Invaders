extends KinematicBody2D
var ammno = preload("res://Enemies/Dreadnought(BOSS)/Ammno.tscn")
onready var t1 = $Turrets/Turret1
onready var t2 = $Turrets/Turret3
onready var pl1 = $Turrets/Turret1/Left
onready var pl2 = $Turrets/Turret3/Left
onready var pr1 = $Turrets/Turret1/Right
onready var pr2 = $Turrets/Turret3/Right
onready var tw1 = $Turrets/Turret1/Tween
onready var tw2 = $Turrets/Turret3/Tween
var i = 0
func shoot(index):
	var shooter
	var pointer
	var tweener
	match index:
		1:
			shooter = t1
			pointer = pl1
			tweener = tw1
		2:
			shooter = t2
			pointer = pl2
			tweener = tw2
	
	var shoot = ammno.instance()
	get_node("..").add_child(shoot)
	shoot.position = pointer.global_position
	shoot.rotation = shooter.rotation-deg2rad(270)
	shoot.set_angle(shooter.rotation-deg2rad(90))
	$Timer2.start()
	$Turrets/Turret1/Tween.interpolate_property($"Turrets/Turret1/Left/Sprite","scale",scale,Vector2(1,0.8),0.2,Tween.TRANS_BOUNCE,Tween.EASE_OUT)
	$Turrets/Turret1/Tween.start()
	
func _on_Timer_timeout():
	if i==2:
		i=0
	i+=1
	shoot(i)
	pass # Replace with function body.


func _on_Timer2_timeout():
	var shooter
	var pointer
	var tweener
	match i:
		1:
			shooter = t1
			pointer = pr1
			tweener = tw1
		2:
			shooter = t2
			pointer = pr2
			tweener = tw2
	var shoot = ammno.instance()
	get_node("..").add_child(shoot)
	tweener.inter
	shoot.position = pointer.global_position
	shoot.rotation = shooter.rotation-deg2rad(270)
	shoot.set_angle(shooter.rotation-deg2rad(90))
	pass # Replace with function body.
