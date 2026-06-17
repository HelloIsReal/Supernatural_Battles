extends Node3D

@onready var swordBlockedPlayer = $swordBlock



@onready var player = get_tree().get_first_node_in_group("player")
var homingBullet=true
var projectileSpeed=15
var bodySize = 0.3 # offsets the orbs to hit the player body and not feet.
var projectileColor: Color = "RED"
@onready var target_position = player.global_position
var targetSet=false
var attackType=0

func _ready() -> void:
	#$MeshInstance3D.mesh.material.albedo_color = projectileColor
	#if projectileColor == Color.RED:
		#print("red!")
		#$MeshInstance3D.mesh.material.albedo_color = projectileColor
	#if projectileColor == Color.BLUE:
		#print("blue!")
		#$MeshInstance3D.mesh.material.albedo_color = projectileColor
	#target_position = player.global_position
	#if (attackType==2): # makes the 2nd projectile type aim at the player once.
		##$aimAtPlayer.start()
		#target_position = player.global_position
		#look_at(target_position, Vector3.UP)
	if attackType==1:
		$MeshInstance3D.mesh.material.albedo_color = Color.BLUE
	elif attackType==2:
		$MeshInstance3D.mesh.material.albedo_color = Color.RED
		
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (attackType==1): #homing bullet
		target_position = player.global_position
		look_at(target_position, Vector3.UP)
		global_position -= transform.basis.z * projectileSpeed * delta
	if (attackType==2): #non-homing bullet aimed at player
		#target_position = player.global_position
		#look_at(target_position, Vector3.UP)
		if !targetSet:
			target_position = player.global_position
			look_at(target_position, Vector3.UP)
			targetSet=true
		global_position -= transform.basis.z * projectileSpeed * delta
	if (attackType==3):
		pass
		
	#if(homingBullet): # all the attempts at making the projectiles work
		# all commented code here, to be deleted when finished.
		##projectileColor = Color.BLUE
		##position.x += projectileSpeed * delta
		#
		##position.y += projectileSpeed * delta
		##target_position = player.global_position
		##look_at(player)
		###global_position -= target_postion * delta
		##global_position.z = -transform.basis.z * projectileSpeed
		##print(-global_transform.basis.z)
		#target_position = player.global_position
		#look_at(target_position, Vector3.UP)
		#global_position -= transform.basis.z * projectileSpeed * delta
		#print(target_position)
		##position.y -=1
		##global_translate(-global_transform.basis.z * projectileSpeed * delta)
		###rotation.y = lerp_angle( rotation.y, atan2( player.position.x, player.position.z ), 1 )
		##position -= global_position.direction_to(Vector3(player.position.x, player.position.y + bodySize, player.position.z)) * projectileSpeed * delta
		##position = position.lerp(player.position, projectileSpeed * delta)
	#else:
		##projectileColor = Color.RED
		##position.x += projectileSpeed * delta
		##rotation = Vector3.ZERO
		#position += global_transform.basis.z * projectileSpeed * delta
		##if !targetSet:
			##targetSet=true
			##look_at(target_position, Vector3.UP)
		##global_translate(-global_transform.basis.z * projectileSpeed * delta)
		#pass
		

func _on_lifetime_timeout() -> void:
	queue_free()


func _on_area_entered(area: Area3D) -> void:
	#print(area)
	print(attackType)
	if area.is_in_group("player"):
		print("player hit by projectile attackType of ",attackType)
		Globals.damagePlayer.emit(2)
		queue_free()
	if area.is_in_group("playerAttack"):
		print("blocked by sword!")
		##$CollisionShape3D.disabled = true
		#remove_child(swordBlockedPlayer)
		#get_tree().current_scene.add_child(swordBlockedPlayer)
		#
		#swordBlockedPlayer.play()
		#await swordBlockedPlayer.finished
		#swordBlockedPlayer.queue_free()
		#AudioPlayerScript.swordBlockSFX()
		queue_free()


#func _on_aim_at_player_timeout() -> void:
	#target_position = player.global_position
	#look_at(target_position, Vector3.UP)
