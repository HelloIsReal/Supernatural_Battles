extends Node3D

@onready var player = get_tree().get_first_node_in_group("player")
var homingBullet=true
var projectileSpeed=15
var bodySize = 0.3 # offsets the orbs to hit the player body and not feet.
var projectileColor: Color = "RED"

func _ready() -> void:
	$MeshInstance3D.mesh.material.albedo_color = projectileColor
	if projectileColor == Color.RED:
		pass
	if projectileColor == Color.BLUE:
		pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(homingBullet):
		#$enemyProjectile.look_at(player)
		#position.x += 1
		#rotation.y = lerp_angle( rotation.y, atan2( player.position.x, player.position.z ), 1 )
		position -= global_position.direction_to(Vector3(player.position.x, player.position.y + bodySize, player.position.z)) * projectileSpeed * delta
		#position = position.lerp(player.position, projectileSpeed * delta)

func _on_area_3d_area_entered(area: Area3D) -> void:
	print(area)
	if area.is_in_group("player"):
		print("sigma player is about to die now hahaha")
		Globals.damagePlayer.emit(2)
		queue_free()


func _on_lifetime_timeout() -> void:
	queue_free()
