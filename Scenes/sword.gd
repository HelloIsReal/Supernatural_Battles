@tool extends XRToolsPickable 

var onFire=false
@export var cursedEnergyDrainAmount = 2
@export var cursedEnergyDrainTime = 0.5
var cursedEnergydmgmultiplier = 2
var baseDamage = 2
#signal controllerInput(XRController3D)
#test to see if works
#var held_by = null
#var held_controller : XRController3D = null
func _ready():
	super() # this is needed, or else the Pickable.gd script this script is extending wont function correctly
	$GPUTrail3D.visible = false
	$tickTime.wait_time = cursedEnergyDrainTime

func _physics_process(_delta: float) -> void:
	if get_picked_up_by_controller():
		pass
		
	if onFire and Globals.cursedEnergyAmount <= cursedEnergyDrainAmount:
		onFire=false
		
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
	if !onFire and Globals.cursedEnergyAmount > cursedEnergyDrainAmount:
		Globals.swordDamage = baseDamage * cursedEnergydmgmultiplier
		onFire=true
		$GPUTrail3D.visible = true
		Globals.cursedEnergyInUse=true
		$tickTime.start()
		$flameSounds.play()
		print("Fire on")
		
	elif onFire:
		turnOffFire()

func _on_tick_time_timeout():
	Globals.cursedEnergyAmount -= cursedEnergyDrainAmount

func turnOffFire():
	Globals.swordDamage = baseDamage
	onFire=false
	Globals.cursedEnergyInUse=false
	$tickTime.stop()
	$flameSounds.stop()
	$GPUTrail3D.visible = false
	print("Fire off")


func _on_released(pickable, by):
	turnOffFire()
