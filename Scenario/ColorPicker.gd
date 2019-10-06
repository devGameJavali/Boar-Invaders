extends ColorPicker


func _on_ColorPicker_color_changed(color):
	Root.col = color
	$"../../Ship/sprites/Color".modulate = Root.col
	pass # Replace with function body.


func _on_Button2_pressed():
	get_tree().change_scene("res://Scenario/Root.tscn")
	pass # Replace with function body.


func _on_Button_pressed():
	Root.col = null
	$"../../Ship/sprites/Color".modulate = 0
	pass # Replace with function body.
