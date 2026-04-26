extends ProgressBar



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	$".".value = Globals.cursedEnergyAmount
