extends Area2D

export var speed = 350
export var steer_force = 35.0
const attack = 20

var velocity = Vector2.ZERO
var acceleration = Vector2.ZERO
var target
var father

func _ready():
	set_physics_process(false)
func start(_transform,_target,_father):
	$start.start()
	global_transform = _transform
	velocity = transform.x * speed
	target = _target
	father = _father

func _physics_process(delta):
	if is_queued_for_deletion():
		_next_shoot()
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
		if body.is_in_group("ship"):
			body.take_damage(attack)
			_next_shoot()
			queue_free()
		elif body.is_in_group("bullet"):
			queue_free()
			body.queue_free()
	pass # Replace with function body.

func _on_start_timeout():
	$Launch.play()
	set_physics_process(true)
	$"Node/track".set_physics_process(true)
	$start.queue_free()
	pass # Replace with function body.

func _next_shoot():
	var a = get_parent().get_children()
	for i in a:
		if i== father:
			if father.can_missile1 == true:
				father.can_missile2 = true
			else:
				father.can_missile1 = true


func _on_Launch_finished():
	$Launch.queue_free()
	pass # Replace with function body.
