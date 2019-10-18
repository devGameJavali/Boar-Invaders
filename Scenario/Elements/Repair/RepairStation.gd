extends StaticBody2D

var can_repair = false
var last_body = null

func _physics_process(delta):
	if can_repair==true:
		if Input.is_action_just_pressed("R") and last_body.repT >0:
			last_body.repair()
			can_repair = false
			last_body.global_position = global_position
			last_body.global_rotation = global_rotation
			$Timer.start()


func _on_Area_body_entered(body):
	if body.name == "Ship":
		get_node(str(get_path_to(body))+"/Interface/Label").visible = true
		can_repair=true
		last_body = body
	elif body.name != "RepairStation":
		print(body.name)
		body.queue_free()
		return
	pass # Replace with function body.


func _on_Area_body_exited(body):
	if body.name == "Ship":
		get_node(str(get_path_to(body))+"/Interface/Label").visible = false
		can_repair=false
	pass # Replace with function body.


func _on_Timer_timeout():
	last_body.imobe = false
	pass # Replace with function body.


func _on_Area_area_entered(area):
	area.queue_free()
	pass # Replace with function body.
