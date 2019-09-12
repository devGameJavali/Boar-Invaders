extends KinematicBody2D
const IDLE = 0
const RIGHT1 = 14
const RIGHT2 = 15
const LEFT1 = 3
const LEFT2 = 6
enum anim {IDLE,RIGHT1,RIGHT2,LEFT1,LEFT2}

var bullet = preload("res://LaserBullet.tscn")

const SPEED = 7

func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		$Sprite.frame = LEFT1
		position.x += SPEED
		$Sprite.frame = LEFT2
	elif Input.is_action_pressed("ui_left"):
		$Sprite.frame = RIGHT1
		position.x -= SPEED
		$Sprite.frame = RIGHT2
	else:
		$Sprite.frame = IDLE
		
func _input(event):
	if event is InputEventMouseButton:
		var shoot = bullet.instance()
		get_node("..").add_child(shoot)
		shoot.position = position
