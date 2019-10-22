extends StaticBody2D
var life = 3
var missile = preload("res://Enemies/MissileBatery(3)/Missile.tscn")
var can_missile1 = true
var can_missile2 = true

func _physics_process(delta):
	if is_queued_for_deletion():
		var a =$"../../..".get_children()
		for i in a:
			if i.is_in_group("missile"):
				i.queue_free()
func _ready():
	life = 10
	$Scaler/TextureProgress.value = life
	$Scaler/TextureProgress.max_value = life
func damage(dam):
	life -= dam
	$Scaler/TextureProgress.value = life
	if life < 1:
		queue_free()
	return true
func _on_shooter_timeout():
	if can_missile1 == true:
		can_missile1 = false
		var rocket = missile.instance()
		get_node("..").add_child(rocket)
		rocket.global_transform[2] = $Missile.get_global_transform()[2]
		rocket.start($Missile.get_global_transform(),$"../../../Ship",self)
	if can_missile2 == true:
		can_missile2 = false
		var rocket2 = missile.instance()
		get_node("..").add_child(rocket2)
		rocket2.global_transform[2] = $Missile2.get_global_transform()[2]
		rocket2.start($Missile2.get_global_transform(),$"../../../Ship",self)
	#rocket.start(get_global_transform(),$"../Ship")
	pass # Replace with function body."."