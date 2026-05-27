extends Node3D

@onready var elevatorSFX = get_node("AudioStreamPlayer3D")

func _ready() -> void:
	elevatorDoorOpen()
	elevatorSFX.play()


func elevatorDoorOpen():
	var tween = get_tree().create_tween()
	tween.tween_property($door, "position", Vector3(2.1,0,0), 3).set_trans(Tween.TRANS_QUAD)
	await tween.finished

func elevatorDoorClose():
	var tween = get_tree().create_tween()
	tween.tween_property($door, "position", Vector3(0.0,0,0), 3).set_trans(Tween.TRANS_QUAD)
