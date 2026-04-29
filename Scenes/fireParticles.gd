extends Node3D

@export var particleSpeed = 1

func _ready():
	$fire.speed_scale = particleSpeed
	$fire.emitting = true
	$sparks.emitting = true

func _physics_process(delta):
	if $".".visible == true:
		$fire.emitting = true
		$sparks.emitting = true
	else:
		$fire.emitting = false
		$sparks.emitting = true
			
