extends Area2D

export var speed = 350
export var steer_force = 35.0

var velocity = Vector2.ZERO
var acceleration = Vector2.ZERO
var target


func _ready():
	set_physics_process(false)
func start(_transform,_target):
	$start.start()
	global_transform = _transform
	velocity = transform.x * speed
	target = _target

func _physics_process(delta):
	acceleration += _target()
	velocity += acceleration * delta
	velocity = velocity.clamped(speed)
	rotation = velocity.angle()
	position += velocity * delta

func _target():
	var steer = Vector2.ZERO
	if target:
		var path = (target.position-position).normalized()*speed
		steer = (path-velocity).normalized()*steer_force
	return steer

func _on_Missile_body_entered(body):
	if body.is_in_group("player"):
		#$"../Interface/VSplitContainer/life"._update(-5)
		queue_free()
	pass # Replace with function body.


func _on_start_timeout():
	set_physics_process(true)
	$"Node/track".set_physics_process(true)
	$start.queue_free()
	pass # Replace with function body.
