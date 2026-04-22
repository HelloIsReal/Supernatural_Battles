extends Node3D

@export var arrivalTime = 45

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$capsule/countdownTimer/Timer.wait_time = arrivalTime
	$capsule/countdownTimer/Timer.start()
	var tween = get_tree().create_tween()
	tween.tween_property($capsule, "position", Vector3(0,0,0), arrivalTime)

func _process(delta: float) -> void:
	$capsule/countdownTimer/Label3D.text = "T-Minus: \n %.1f" %  $capsule/countdownTimer/Timer.time_left
