extends ProgressBar

func _ready():
	$".".max_value = Globals.playerHealth

func _physics_process(delta):
	$".".value = Globals.playerHealth
