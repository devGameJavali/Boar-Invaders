extends Node2D
var w = 0
var b =0
var e =0
var wings = ["res://Ship/Parts/WINGS1.png","res://Ship/Parts/WINGS2.png"]
var bodies = ["res://Ship/Parts/BODY1.png","res://Ship/Parts/BODY2.png"]
var engines =["res://Ship/Parts/ENGINE1.png","res://Ship/Parts/ENGINE2.png"]

func _updateText():
	$wings.texture = load(wings[w])
	$body.texture = load(bodies[b])
	$engine.texture = load(engines[e])

func _on_wing_pressed():
	if w==0:
		w=1
	else:
		w=0
	_updateText()
	pass # Replace with function body.


func _on_body_pressed():
	if b==0:
		b=1
	else:
		b=0
	_updateText()
	pass # Replace with function body.


func _on_engine_pressed():
	if e==0:
		e=1
	else:
		e=0
	_updateText()
	pass # Replace with function body.
