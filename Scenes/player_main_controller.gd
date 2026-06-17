extends Node3D

### How far away before we start fading to black
#@export_range(0.01, 1.0, 0.01, "suffix:m") var max_distance = 0.5
#
### Distance over which we fade out
#@export_range(0.01, 1.0, 0.01, "suffix:m") var fade_distance = 0.2

## Our fade effect object
#@export var fade_effect : FadeEffect


func _ready():
	#XRServer.center_on_hmd(XRServer.RESET_BUT_KEEP_TILT, false)
	$cursedEnergyRefillTick.start()
	Globals.damagePlayer.connect(takeDamage)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#print($"..".position)
	if !Globals.cursedEnergyInUse:
		$cursedEnergyRefillTick.paused = false
	else:
		$cursedEnergyRefillTick.paused = true
	Globals.cursedEnergyAmount = clamp(Globals.cursedEnergyAmount, 0, Globals.cursedEnergyMax)

func _on_cursed_energy_refill_tick_timeout():
	if Globals.cursedEnergyAmount < Globals.cursedEnergyMax:
		print("refilling!")
		Globals.cursedEnergyAmount += 1

func takeDamage(damage):
	Globals.playerHealth -= damage
	if(Globals.playerHealth<=0):
		print("player is dead!")

################################
	## Handle movement
#
	## Where is our camera in the local space of our character body?
	#var camera_transform = transform * $"..".camera.transform
#
	## Determine our new position
	#var new_position : Vector3 = camera_transform.origin * Vector3(1.0, 0.0, 1.0)
#
	## Now get this in world space
	#new_position = $"../PlayerBody".global_transform * new_position
#
	## Move our character body
	#var original_position = $"../PlayerBody".global_position
	#$"../PlayerBody".move_and_collide(new_position - original_position)
#
	## Check our actual movement
	#var delta_movement = $"../PlayerBody".global_position - original_position
#
	## Convert to local orientation
	#delta_movement = $"../PlayerBody".global_basis.inverse() * delta_movement
#
	## Move our origin in the opposite direction
	#position -= delta_movement
#
	#################################
	## Handle rotation
#
	## We want to determine our forward vector
	#var forward = camera_transform.basis.z * Vector3(1.0, 0.0, 1.0)
#
	## Create a rotation transform out of this
	#camera_transform.origin = Vector3()
	#var rotation_transform = camera_transform.looking_at(forward, Vector3.UP, true)
#
	## Apply this transform to our character body
	#$"../PlayerBody".transform.basis = rotation_transform.basis * $"../PlayerBody".transform.basis
#
	## apply inverse to our origin
	#transform = rotation_transform.inverse() * transform
#
	#################################
	## Handle fade
#
	## Calculate how far away we are from our target location
	#var distance = ($"../PlayerBody".global_position - new_position).length()

	#var fade = clamp((distance - max_distance) / fade_distance, 0.0, 1.0)
	#if fade_effect:
		#fade_effect.fade = fade
