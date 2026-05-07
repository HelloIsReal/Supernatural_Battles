extends Node3D

@onready var player = get_tree().get_first_node_in_group("player")
var homingBullet=true
var projectileSpeed=15
var bodySize = 0.1 # offsets the orbs to hit the player body and not feet.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(homingBullet):
		position -= global_position.direction_to(Vector3(player.global_position.x, player.global_position.y, player.global_position.z)).normalized() * projectileSpeed * delta
		#position = position.lerp(player.position, 1 * delta)

func _on_area_3d_area_entered(area: Area3D) -> void:
	print(area)
	if area.is_in_group("player"):
		print("sigma player is about to die now hahaha")
		Globals.damagePlayer.emit(2)
		queue_free()


func _on_lifetime_timeout() -> void:
	queue_free()
