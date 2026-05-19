extends Node3D

func _ready() -> void:
	elevatorDoorOpen()


func elevatorDoorOpen():
	var tween = get_tree().create_tween()
	tween.tween_property($door, "position", Vector3(2.1,0,0), 3).set_trans(Tween.TRANS_QUAD)
	await tween.finished

func elevatorDoorClose():
	var tween = get_tree().create_tween()
	tween.tween_property($door, "position", Vector3(0.0,0,0), 3).set_trans(Tween.TRANS_QUAD)
