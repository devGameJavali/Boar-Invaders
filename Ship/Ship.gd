extends KinematicBody2D
#enum anim {IDLE=1,FORWARD=0,FORWARDLEFT=14,FORWARDRIGHT=4,BACKWARD=23,BACKWARDLEFT=20,BACKWARDRIGHT=9,LEFT=17,RIGHT=6}
enum anim {IDLE=0,FORWARD=0,FORWARDLEFT=-45,FORWARDRIGHT=45,BACKWARD=180,BACKWARDLEFT=-135,BACKWARDRIGHT=135,LEFT=-90,RIGHT=90}
var can_shoot:bool = true

var bullet = preload("res://Ship/Bullet/LaserBullet.tscn")
var missile = preload("res://Enemies/MissileBatery(3)/Missile.tscn")
func _ready():
	if Root.col != null:
		get_color()
const SPEED:int = 400
const ACEL = 25
const REST = 5
var velocity:Vector2

func _physics_process(delta):
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
		#velocity -=(Vector2(10,0).rotated(deg2rad(rotation_degrees-90)).clamped(SPEED))/2
		#ativação de inércia
		#velocity.y = inertia(velocity.y)
	velocity = velocity.clamped(SPEED)
	move_and_slide(velocity)
	#rotation_degrees = (rad2deg(velocity.angle())+90)
		
		
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
#func start(_transform,_target):
#	global_transform = _transform
#	velocity = transform.x * speed
#	target = _target
#
#func _physics_process(delta):
#	acceleration += _target()
#	velocity += acceleration * delta
#	velocity = velocity.clamped(speed)
#	rotation = velocity.angle()
#	position += velocity * delta


func _input(event):
	if $"..".name != "Container":
		if event is InputEventMouseButton and can_shoot == true:
			if event.is_action_pressed("mouseL"):
				shoot($weL.get_global_transform()[2])
			if event.is_action_pressed("mouseR"):
				shoot($weR.get_global_transform()[2])

func shoot(pos):
	var shoot = bullet.instance()
	get_node("..").add_child(shoot)
	shoot.position = pos
	shoot.rotation = rotation
	shoot.set_angle(rotation)
	can_shoot = false
	$shoot.start()
func _on_shoot_timeout():
	can_shoot=true
	pass # Replace with function body.


func get_color():
	$"sprites/Color".modulate = Root.col
