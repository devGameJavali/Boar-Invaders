extends KinematicBody2D
enum anim {IDLE=0,FORWARD=0,FORWARDLEFT=-45,FORWARDRIGHT=45,BACKWARD=180,BACKWARDLEFT=-135,BACKWARDRIGHT=135,LEFT=-90,RIGHT=90}
var can_shootL:bool = true
var can_shootR:bool = true

var i = 0

var bullet = preload("res://Ship/Bullet/LaserBullet.tscn")
var bomb = preload("res://Ship/Bullet/Bomb.tscn")

const SPEED:int = 400
const ACEL = 25
const REST = 5

var velocity:Vector2

func _ready():
	print(deg2rad(90))
	print(rad2deg(1.5708))
	OS.low_processor_usage_mode = true
	get_color()

#movimentação
func _physics_process(delta):
	if Input.is_action_just_pressed("ui_page_up"):
		_dash()
	
	if $"..".name == "Tests":
		$"../CanvasLayer/TextureProgress".value = Root.energy
	if Input.is_action_just_pressed("space") and Root.energy > 100:
		Root.energy -=100
		var b = bomb.instance()
		get_node("..").add_child(b)
		b.position = global_position
		b.set_angle(rotation)
	
	if Input.is_action_just_pressed("enter"):
		if $"Shield".active== false:
			$"Shield".active= true
			$"Shield"/Sprite.show()
		else:
			$"Shield".active= false
			$"Shield"/Sprite.hide()
	#velocity = Vector2(0,0)
	if Input.is_action_pressed("ui_right"):
		rotation_degrees+=3
	elif Input.is_action_pressed("ui_left"):
		rotation_degrees-=3
	if Input.is_action_pressed("ui_up"):
		$sprites/Burn.show()
		velocity += (Vector2(100,0).rotated(deg2rad(rotation_degrees-90)).normalized())*8
	elif Input.is_action_pressed("ui_down"):
		velocity -= (Vector2(100,0).rotated(deg2rad(rotation_degrees-90)).normalized())*8
	else:
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
func _input(event):
	if $"..".name != "Container":
		if event is InputEventMouseButton and can_shootL == true:
			if event.is_action_pressed("mouseL"):
				shoot($weL.global_position)
				can_shootL = false
				$shootL.start()
		if event is InputEventMouseButton and can_shootR == true:
			if event.is_action_pressed("mouseR"):
				shoot($weR.global_position)
				can_shootR = false
				$shootR.start()
		if event is InputEventMouseMotion:
			var target = rad2deg(get_angle_to(get_global_mouse_position()))+90
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
	Input.set_default_cursor_shape(i)
	i+= 1
	if i ==16:
		i = 0
	if Root.energy<1000:
		Root.energy += 10
	if $"Shield".active == true:
		Root.energy -=5
	pass # Replace with function body.


func _dash():
	z_index = -10
	set_physics_process(false)
	var t = Tween.new()
	self.add_child(t)
	t.interpolate_property(self,"position",position,position+Vector2(1500,0).rotated(rotation-1.5708),2.5,Tween.TRANS_CUBIC,Tween.EASE_IN)
	t.start()
	z_index = 0
	set_physics_process(true)

