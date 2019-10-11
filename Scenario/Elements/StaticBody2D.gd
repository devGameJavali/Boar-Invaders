extends StaticBody2D

func _ready():
	$Tween.interpolate_property(self,"rotation_degrees",rotation_degrees,rotation_degrees+360,10.0,Tween.TRANS_LINEAR,Tween.EASE_IN)
	$Tween.start()                            

func _on_Tween_tween_completed(object,key):
	$Tween.interpolate_property(self,"rotation_degrees",rotation_degrees,rotation_degrees+360,10.0,Tween.TRANS_LINEAR,Tween.EASE_IN)
	$Tween.start()           