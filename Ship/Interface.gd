extends CanvasLayer
var max_life = 100

func _ready():
	$Container/VSplitContainer/TextureProgress.max_value = max_life
func update_life(life):
	$Container/VSplitContainer/TextureProgress.value = life