@tool extends XRToolsPickable 


#signal controllerInput(XRController3D)
#test to see if works
#var held_by = null
#var held_controller : XRController3D = null
func _ready():
	$GPUTrail3D.visible = false

func _physics_process(_delta: float) -> void:
	if get_picked_up_by_controller():
		pass
		#print("sword picked up!")
	#if is_picked_up():
		#print("I am awake~!")
	#is_gripped = get_tracker_hand() #get_float("grip") > threshold and get_float("trigger") > threshold
	#if is_picked_up() and controller_action(): #XRController3D.is_button_pressed("ax_button"):
 	#pass
	#if held_controller:
		#if held_controller.is_button_pressed("trigger_click"):
			#print("Trigger clicked while sword held!")
#func _ready():
	#self.controllerInput.connect(registerInput)

func ping():
	print("ping!") 
	
	#test to see if this works
	#if held_by.is_button_pressed("ax_button"):
		#print("omg it worked, sword go brrrrr")

#test to see if this works with other one
#func _on_picked_up(pickable: Variant) -> void:
	#held_by = pickable
	
#test to see if this works with other one
#func _on_dropped(pickable: Variant) -> void:
	#held_by = null

#
#func _on_picked_up(controller: XRController3D) -> void:
	#held_controller = controller
#
#
#func _on_dropped() -> void:
	#held_controller = null
func action():
	if $trailLifetime.is_stopped() and Globals.cursedEnergyAmount >= 10:
		$trailLifetime.start()
		$flameSounds.play()
		Globals.cursedEnergyAmount -= 10
		$GPUTrail3D.visible = true
		print("Action button action works!")


func _on_trail_lifetime_timeout() -> void:
	$GPUTrail3D.visible = false
	$flameSounds.stop()
