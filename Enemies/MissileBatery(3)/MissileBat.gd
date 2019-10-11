extends StaticBody2D
var life = 3
var missile = preload("res://Enemies/MissileBatery(3)/Missile.tscn")
var can_missile = true
func _ready():
	life = 10
	$Scaler/TextureProgress.value = life
	$Scaler/TextureProgress.max_value = life
func damage():
	life -= 1
	$Scaler/TextureProgress.value = life
	if life < 1:
		queue_free()
		return true
	return false
func _on_shooter_timeout():
	if can_missile == true:
		var rocket = missile.instance()
		var rocket2 = missile.instance()
		get_node("..").add_child(rocket)
		get_node("..").add_child(rocket2)
		rocket.global_transform[2] = $Missile.get_global_transform()[2]
		rocket2.global_transform[2] = $Missile2.get_global_transform()[2]
		rocket.start($Missile.get_global_transform(),$"../Ship",self)
		rocket2.start($Missile2.get_global_transform(),$"../Ship",self)
		can_missile = false
	#rocket.start(get_global_transform(),$"../Ship")
	pass # Replace with function body."."