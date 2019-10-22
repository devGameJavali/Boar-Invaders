extends Area2D
var active = false
signal update_energy

func _physics_process(delta):
	if active == false:
		$CollisionPolygon2D.disabled = true
		$Sprite.visible = false
	else:
		$CollisionPolygon2D.disabled = false
		$Sprite.visible = true
func _on_Shield_body_entered(body):
	if $"..".energy<0:
		active = false
		return
	if body.is_in_group("enemy") and (body.is_in_group("bullet")):
		var damage = 40
		if body.is_in_group("dreadnought"):
			damage = 100
		body.queue_free()
		if active == true:
			$"..".energy -= damage
			emit_signal("update_energy",$"..".energy)
			#print(Root.energy)
			



func _on_Shield_area_entered(body):
	return