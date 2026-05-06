extends Node3D

@onready var player = get_tree().get_first_node_in_group("player")
var homingBullet=true
var projectileSpeed=5


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(homingBullet):
		position += position.direction_to(player.position) * projectileSpeed * delta

func _on_area_3d_area_entered(area: Area3D) -> void:
	print(area)
	if area.is_in_group("player"):
		$lifetime.start()
		print("sigma player is about to die now hahaha")
		Globals.damagePlayer.emit(2)
		queue_free()


func _on_lifetime_timeout() -> void:
	queue_free()
