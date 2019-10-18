extends CanvasLayer
var max_life = 100
var max_energy = 1000

func _ready():
	$Container/VSplitContainer/ProgressBar.max_value = max_energy
	$Container/VSplitContainer/TextureProgress.max_value = max_life
func update_life(life):
	$Container/VSplitContainer/TextureProgress.value = life
func update_shield(energy):
	print(energy)
	$Container/VSplitContainer/ProgressBar.value = energy

