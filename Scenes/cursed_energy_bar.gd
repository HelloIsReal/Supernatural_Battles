extends ProgressBar



func _ready():
	$".".max_value = Globals.cursedEnergyMax

func _physics_process(_delta):
	$".".value = Globals.cursedEnergyAmount
