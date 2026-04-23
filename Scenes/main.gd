extends Node3D

@export var arrivalTime = 60

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$timeBeforePlatformMove.start()

func _physics_process(delta):
	$capsule/countdownTimer/Label3D.text = "T-Minus: \n %.1f" %  $Timer.time_left


func _on_time_before_platform_move_timeout():
	$Timer.wait_time = arrivalTime
	$Timer.start()
	var tween = get_tree().create_tween()
	tween.tween_property($capsule, "position", Vector3(0,0,0), arrivalTime)
