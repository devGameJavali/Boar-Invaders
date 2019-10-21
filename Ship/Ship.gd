
extends KinematicBody2D
enum anim {IDLE=0,FORWARD=0,FORWARDLEFT=-45,FORWARDRIGHT=45,BACKWARD=180,BACKWARDLEFT=-135,BACKWARDRIGHT=135,LEFT=-90,RIGHT=90}
var can_shootL:bool = true
var can_shootR:bool = true

var imobe = false

var i = 0

var bullet = preload("res://Ship/Bullet/LaserBullet.tscn")
var bomb = preload("res://Ship/Bullet/Bomb.tscn")

var SPEED:int = 400
var ACEL = 25
const REST = 5
var steer = 3
var life = 200
var energy = 500
var repT = 3

var velocity:Vector2

func _ready():
	$"Interface/Container/VSplitContainer/Repairs/Label".text = str(repT)
	take_damage(0)
	$Shield.emit_signal("update_energy",energy)
	if $"../..".name == "Customization":
		set_physics_process(false)
	#OS.low_processor_usage_mode = true
	get_color()

#movimentação
func _physics_process(delta):
	if imobe == true:
		return
	
	
	
	if Input.is_action_just_pressed("ui_page_up"):
		$sprites/Burn.show()
		imobe = true
		_dash()
	
	if Input.is_action_just_pressed("space") and energy > 100:
		$Interface.update_shield(200)
		var b = bomb.instance()
		get_node("..").add_child(b)
		b.position = global_position
		b.set_angle(rotation)
	
	if Input.is_action_pressed("mouseL") and can_shootL==true:
		shoot($weL.global_position)
		can_shootL = false
		$shootL.start()
		$ShootSound.play()
	elif Input.is_action_pressed("mouseR")and can_shootR==true:
		shoot($weR.global_position)
		can_shootR = false
		$shootR.start()
		$ShootSound.play()
	
	
	if Input.is_action_just_pressed("enter"):
		if energy <100:
			return
		if $"Shield".active== false:
			$"Shield".active= true
		else:
			$"Shield".active= false
	#velocity = Vector2(0,0)
	if Input.is_action_pressed("ui_right"):
		rotation_degrees+=steer
	elif Input.is_action_pressed("ui_left"):
		rotation_degrees-=steer
	if Input.is_action_pressed("ui_up"):
		$sprites/Burn.show()
		velocity += (Vector2(100,0).rotated(deg2rad(rotation_degrees-90)).normalized())*8
	elif Input.is_action_pressed("ui_down"):
		velocity -= (Vector2(100,0).rotated(deg2rad(rotation_degrees-90)).normalized())*8
	else:
		if imobe == false:
			$sprites/Burn.hide()
		velocity.y = inertia(velocity.y)
		velocity.x = inertia(velocity.x)
	velocity = velocity.clamped(SPEED)
	move_and_slide(velocity)


#calculo física
func inertia(vel):
	if vel>0:
		if vel>25:
			vel -= REST
		else:
			vel = 0
	elif vel<0:
		if vel<-25:
			vel += REST
		else:
				vel = 0
	return vel

#tiros
#func _input(event):
		#if event is InputEventMouseMotion:
			#var target = rad2deg(get_angle_to(get_global_mouse_position()))+90
			#if target<0:
				#rotation_degrees += min(target*0.05,-1)
			#else:
				#rotation_degrees += max(target*0.05,1)





func shoot(pos):
	Root.energy -=5
	var shoot = bullet.instance()
	get_node("..").add_child(shoot)
	shoot.position = pos
	shoot.rotation = rotation
	shoot.set_angle(rotation)



func _on_shootL_timeout():
	can_shootL=true
	pass # Replace with function body.


func _on_shootR_timeout():
	can_shootR=true
	pass # Replace with function body.


func get_color():
	if Root.col != null:
		$"sprites/Color".modulate = Root.col

func _1_sec_function():
	#Input.set_default_cursor_shape(i)
	i+= 1
	if i ==16:
		i = 0
	if energy<500:
		energy += 50
	if $"Shield".active == true:
		energy -=55
	$Interface.update_shield(energy)
	pass # Replace with function body.

func _dash():
	$sprites/Burn.show()
	z_index = -10
	var t = $Tween
	t.interpolate_property(self,"position",position,position+Vector2(1500,0).rotated(rotation-1.5708),2.5,Tween.TRANS_CUBIC,Tween.EASE_IN)
	t.start()
	z_index = 0


func _on_Tween_tween_completed(object, key):
	$sprites/Burn.hide()
	imobe = false
	pass # Replace with function body.


func take_damage(dam):
	life -= dam
	$Interface.update_life(life)
	if life<0:
		#get_tree().change_scene("res://Game Over.tscn")
		print("morreu")
	elif life<100:
		if SPEED == 400:
			SPEED = SPEED/2



func repair():
	SPEED = 400
	imobe = true
	repT-=1
	$"Interface/Container/VSplitContainer/Repairs/Label".text = str(repT)
	var bar = $Interface/Container/VSplitContainer/TextureProgress
	life = 200
	var t = $Tween
	t.interpolate_property(bar,"value",bar.value,100,10.0,Tween.TRANS_CUBIC,Tween.EASE_IN)
	t.start()
	