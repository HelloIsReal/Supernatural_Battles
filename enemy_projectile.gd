extends Node3D

@onready var player = get_tree().get_first_node_in_group("player")
var homingBullet=true
var projectileSpeed=5
var bodySize = 0.3 # offsets the orbs to hit the player body and not feet.
var projectileColor: Color = "RED"
@onready var target_position = player.global_position
var targetSet=false

func _ready() -> void:
	$MeshInstance3D.mesh.material.albedo_color = projectileColor
	#if projectileColor == Color.RED:
		#print("red!")
		#$MeshInstance3D.mesh.material.albedo_color = projectileColor
	#if projectileColor == Color.BLUE:
		#print("blue!")
		#$MeshInstance3D.mesh.material.albedo_color = projectileColor
	#target_position = player.global_position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(homingBullet):
		target_position = player.global_position
		#look_at(player)
		#global_position -= target_postion * delta
		#global_position.z = -transform.basis.z * projectileSpeed
		#print(-global_transform.basis.z)
		look_at(target_position, Vector3.UP)
		#position.y -=1
		global_translate(-global_transform.basis.z * projectileSpeed * delta)
		##rotation.y = lerp_angle( rotation.y, atan2( player.position.x, player.position.z ), 1 )
		#position -= global_position.direction_to(Vector3(player.position.x, player.position.y + bodySize, player.position.z)) * projectileSpeed * delta
		#position = position.lerp(player.position, projectileSpeed * delta)
	else:
		#if !targetSet:
			#targetSet=true
			#look_at(target_position, Vector3.UP)
		global_translate(-global_transform.basis.z * projectileSpeed * delta)
		pass

func _on_area_3d_area_entered(area: Area3D) -> void:
	print(area)
	if area.is_in_group("player"):
		print("sigma player is about to die now hahaha")
		Globals.damagePlayer.emit(2)
		queue_free()


func _on_lifetime_timeout() -> void:
	queue_free()
