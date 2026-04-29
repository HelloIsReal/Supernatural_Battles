extends Node3D

@export var arrivalTime = 60
var xr_interface: XRInterface

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$timeBeforePlatformMove.start()
	
	xr_interface = XRServer.find_interface("OpenXR")
	
	if xr_interface and xr_interface.is_initialized():
		print("OpenXR Initialized successfully")
		
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)
		
		get_viewport().use_xr = true
	else:
		print("OpenXR not initialized, check if headset is connected")

func _physics_process(delta):
	$capsule/countdownTimer/Label3D.text = "T-Minus: \n %.1f" %  $Timer.time_left
	$earth.rotation.x += 0.0002
	$earth.rotation.y += 0.0001


func _on_time_before_platform_move_timeout():
	$Timer.wait_time = arrivalTime
	$Timer.start()
	var tween = get_tree().create_tween()
	tween.tween_property($capsule, "position", Vector3(-100,300,300), 10)
	await tween.finished
	print("??? Thruster issue") # add cutscene that shows something before crashlanding into earth
	await create_tween().tween_interval(3).finished
	tween = get_tree().create_tween()
	tween.tween_property($capsule, "position", Vector3(0,100,0), arrivalTime-20)
	
