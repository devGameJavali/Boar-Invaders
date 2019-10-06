extends Label

func _physics_process(delta):
	text = str(Performance.get_monitor(Performance.TIME_FPS))