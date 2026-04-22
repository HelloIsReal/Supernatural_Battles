class_name GrippableXRController3D extends XRController3D

signal gripped
signal released


@export var threshold: float = 0.9
@export var handParticles: GPUParticles3D

var held_object = null

@export var is_energy: bool:
	set(value):
		if not is_energy and value:
			gripped.emit()
		elif is_energy and not value:
			released.emit()
		is_energy = value
@export var is_sword: bool:
	set(value):
		if not is_energy and value:
			gripped.emit()
		elif is_energy and not value:
			released.emit()
		is_energy = value
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	# Cursed Energy mode
	is_energy = get_float("grip") > threshold and get_float("trigger") > threshold and is_button_pressed("ax_button")
	#is_sword = get_float("grip") > threshold and is_button_pressed("by_button")
#	print(self.velocity)
	if(is_energy):
		handParticles.emitting = true
	else:
		handParticles.emitting = false
	#if(get_float("grip") > threshold and is_button_pressed("by_button") and held_object.name=="Sword"):
		#print("hooray!")
		#$FunctionPickup.action_button_action()
	#if(is_button_pressed("action_button_action") and held_object.name=="Sword"):
		#print("work!")
	#if(held_object):#.name=="Sword"):
		##held_object.controllerInput.emit(self)
		#held_object.ping()
		#$FunctionPickup.action_button_action()
	
	



func _on_function_pickup_has_picked_up(what):
	held_object = what

func _on_function_pickup_has_dropped():
	held_object = null
