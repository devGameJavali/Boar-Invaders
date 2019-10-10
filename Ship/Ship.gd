extends KinematicBody2D
enum anim {IDLE=0,FORWARD=0,FORWARDLEFT=-45,FORWARDRIGHT=45,BACKWARD=180,BACKWARDLEFT=-135,BACKWARDRIGHT=135,LEFT=-90,RIGHT=90}
var can_shootL:bool = true
var can_shootR:bool = true
var rotating = false

var bullet = preload("res://Ship/Bullet/LaserBullet.tscn")
var bomb = preload("res://Ship/Bullet/Bomb.tscn")

const SPEED:int = 400
const ACEL = 25
const REST = 5

var velocity:Vector2

func _ready():
	get_color()

#movimentação
func _physics_process(delta):
	$"../CanvasLayer/TextureProgress".value = Root.energy
	if Input.is_action_just_pressed("space"):
		var b = bomb.instance()
		get_node("..").add_child(b)
		b.position = global_position
		b.set_angle(rotation)
	
	if Input.is_action_just_pressed("enter"):
		if $"Shield".active== false:
			$"Shield".active= true
			$"Shield"/Polygon2D.show()
		else:
			$"Shield".active= false
			$"Shield"/Polygon2D.hide()
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
			var target = rad2deg(get_angle_to(get_global_mouse_position()))
			print(rotation_degrees)
			print(target)
			if target != rotation_degrees:
				if target>rotation_degrees:
					rotation_degrees-=1
				else:
					rotation_degrees+=1

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
	if Root.energy<1000:
		Root.energy += 10
	pass # Replace with function body.
