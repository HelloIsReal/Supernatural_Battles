@tool
extends XRToolsStartXR



func _ready():
	super()
	#$"../playerHitbox".position = $"../XRCamera3D".position
	#XRServer.center_on_hmd(XRServer.RESET_BUT_KEEP_TILT, false)
	$playerMainController/cursedEnergyRefillTick.start()
	Globals.damagePlayer.connect(takeDamage)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#$playerHitbox.global_position = $PlayerBody.global_position
	#print($"..".position)
	if !Globals.cursedEnergyInUse:
		$playerMainController/cursedEnergyRefillTick.paused = false
	else:
		$playerMainController/cursedEnergyRefillTick.paused = true
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
	# Handle movement
#
	## Where is our camera in the local space of our character body?
	#var camera_transform = transform * camera.transform
#
	## Determine our new position
	#var new_position : Vector3 = camera_transform.origin * Vector3(1.0, 0.0, 1.0)
#
	## Now get this in world space
	#new_position = character_body.global_transform * new_position
#
	## Move our character body
	#var original_position = character_body.global_position
	#character_body.move_and_collide(new_position - original_position)
#
	## Check our actual movement
	#var delta_movement = character_body.global_position - original_position
#
	## Convert to local orientation
	#delta_movement = character_body.global_basis.inverse() * delta_movement
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
	#character_body.transform.basis = rotation_transform.basis * character_body.transform.basis
#
	## apply inverse to our origin
	#transform = rotation_transform.inverse() * transform
#
	#################################
	## Handle fade
#
	## Calculate how far away we are from our target location
	#var distance = (character_body.global_position - new_position).length()
