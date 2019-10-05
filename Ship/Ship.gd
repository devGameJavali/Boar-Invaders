extends KinematicBody2D
#enum anim {IDLE=1,FORWARD=0,FORWARDLEFT=14,FORWARDRIGHT=4,BACKWARD=23,BACKWARDLEFT=20,BACKWARDRIGHT=9,LEFT=17,RIGHT=6}
enum anim {IDLE=0,FORWARD=0,FORWARDLEFT=-45,FORWARDRIGHT=45,BACKWARD=180,BACKWARDLEFT=-135,BACKWARDRIGHT=135,LEFT=-90,RIGHT=90}
var can_shoot:bool = true

var bullet = preload("res://Ship/Bullet/LaserBullet.tscn")
func _ready():
	print(anim)
const SPEED:int = 400
var velocity:Vector2
func _physics_process(delta):
	velocity = Vector2(0,0)
	if Input.is_action_pressed("ui_right"):
		if Input.is_action_pressed("ui_up"):
			rotation_degrees = anim.FORWARDRIGHT
			velocity = Vector2(SPEED,-SPEED)
		elif Input.is_action_pressed("ui_down"):
			velocity = Vector2(SPEED,SPEED)
			rotation_degrees = anim.BACKWARDRIGHT
		else:
			velocity = Vector2(SPEED,0)
			rotation_degrees = anim.RIGHT
	elif Input.is_action_pressed("ui_left"):
		if Input.is_action_pressed("ui_up"):
			rotation_degrees = anim.FORWARDLEFT
			velocity = Vector2(-SPEED,-SPEED)
		elif Input.is_action_pressed("ui_down"):
			velocity = Vector2(-SPEED,SPEED)
			rotation_degrees = anim.BACKWARDLEFT
		else:
			velocity = Vector2(-SPEED,0)
			rotation_degrees = anim.LEFT
	elif Input.is_action_pressed("ui_up"):
		velocity = Vector2(0,-SPEED)
		rotation_degrees = anim.FORWARD
	elif Input.is_action_pressed("ui_down"):
		velocity = Vector2(0,SPEED)
		rotation_degrees = anim.BACKWARD
	else:
		rotation_degrees = anim.IDLE
	if abs(velocity.x)-abs(velocity.y)==0:
		velocity *=0.6
	move_and_slide(velocity)
		
func _input(event):
	if event is InputEventMouseButton and can_shoot == true:
		var shoot = bullet.instance()
		get_node("..").add_child(shoot)
		shoot.position = get_global_transform()[2]
		can_shoot = false
		$shoot.start()


func _on_shoot_timeout():
	can_shoot=true
	pass # Replace with function body.


