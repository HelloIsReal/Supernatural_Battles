extends Node3D

func _ready():
	$cursedEnergyRefillTick.start()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !Globals.cursedEnergyInUse:
		$cursedEnergyRefillTick.paused = false
	else:
		$cursedEnergyRefillTick.paused = true
	Globals.cursedEnergyAmount = clamp(Globals.cursedEnergyAmount, 0, Globals.cursedEnergyMax)

func _on_cursed_energy_refill_tick_timeout():
	if Globals.cursedEnergyAmount < Globals.cursedEnergyMax:
		print("refilling!")
		Globals.cursedEnergyAmount += 1
