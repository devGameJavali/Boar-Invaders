extends KinematicBody2D
const IDLE:int = 0
const RIGHT1:int = 14
const RIGHT2:int = 15
const LEFT1:int = 3
const LEFT2:int = 6
enum anim {IDLE,RIGHT1,RIGHT2,LEFT1,LEFT2}
var can_shoot:bool = true

var bullet = preload("res://Ship/Bullet/LaserBullet.tscn")

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
	if event is InputEventMouseButton and can_shoot == true:
		var shoot = bullet.instance()
		get_node("..").add_child(shoot)
		shoot.position = position
		can_shoot = false
		$shoot.start()


func _on_shoot_timeout():
	can_shoot=true
	pass # Replace with function body.


