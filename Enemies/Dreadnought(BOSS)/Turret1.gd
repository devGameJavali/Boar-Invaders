extends KinematicBody2D
var ammno = preload("res://Enemies/Dreadnought(BOSS)/Ammno.tscn")
onready var target = $"../../../Ship"
var can_shoot=true
var life = 10
var id

func _ready():
	id = int(name.right(6))
	print($"../..".armor)
	if $"../..".armor<1:
		$"CollisionShape2D".disabled = false
	$Node2D/TextureProgress.max_value = life
	$Node2D/TextureProgress.value = life
func _physics_process(delta):
	var mouse = get_global_mouse_position()
	var rot = rad2deg(get_angle_to(target.global_position))
	if abs(rot)>45:
		can_shoot=false
	else:
		can_shoot=true
	if abs(rot)>1:
		if rot<0:
			rotation_degrees-=0.5
		else:
			rotation_degrees+=0.5



func shoot():
	if can_shoot==false:
		return
	var shoot = ammno.instance()
	get_node("../../..").add_child(shoot)
	$AudioStreamPlayer2D.play()
	shoot.position = $Right.global_position
	shoot.rotation = rotation-deg2rad(270)
	shoot.set_angle(rotation-deg2rad(90))
	$SecondShoot.start()
	$Right/Tween.interpolate_property($Right/cr1,"scale",Vector2(1,1),Vector2(1,0.8),0.2,Tween.TRANS_QUINT,Tween.EASE_OUT)
	$Right/Tween.start()
func _RightShootBack(object, key):
	if $Right/cr1.scale == Vector2(1,0.8):
		$Right/Tween.interpolate_property($Right/cr1,"scale",Vector2(1,0.8),Vector2(1,1),0.4,Tween.TRANS_LINEAR,Tween.EASE_IN_OUT)
		$Right/Tween.start()
	pass # Replace with function body.
func SecondShoot():
	var shoot = ammno.instance()
	get_node("../../..").add_child(shoot)
	$AudioStreamPlayer2D.play()
	shoot.position = $Left.global_position
	shoot.rotation = rotation-deg2rad(270)
	shoot.set_angle(rotation-deg2rad(90))
	$Left/Tween.interpolate_property($Left/cl1,"scale",Vector2(1,1),Vector2(1,0.8),0.2,Tween.TRANS_QUINT,Tween.EASE_OUT)
	$Left/Tween.start()
	pass # Replace with function body.

func _LeftShootBack(object, key):
	if $Left/cl1.scale == Vector2(1,0.8):
		$Left/Tween.interpolate_property($Left/cl1,"scale",Vector2(1,0.8),Vector2(1,1),0.4,Tween.TRANS_LINEAR,Tween.EASE_IN_OUT)
		$Left/Tween.start()
	pass # Replace with function body.
	
	
func damage(dam):
	life-=1
	$Node2D/TextureProgress.value = life
	if life<1:
		print(id)
		$"../..".T[id-1]=0
		queue_free()