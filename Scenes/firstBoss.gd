extends "res://Scenes/enemy.gd"

const laserAttackLength = 3
@onready var bulletProjectile = preload("res://Scripts/enemy_projectile.tscn")
@onready var player = get_tree().get_first_node_in_group("player")



func _ready() -> void:
	super() # allows the extended script to finish initializing first
	
	energySpinShow()
	await get_tree().create_timer(2).timeout
	$firstAttackVoice.play()
	#await $firstAttackVoice.finished
	energySpinHide()
	await get_tree().create_timer(1).timeout
	laserShotStart()
	attack(false,0.2)
	attack(false,0.4)
	attack(false,0.6)
	attack(false,0.8)
	await get_tree().create_timer(1).timeout
	laserShotStop()
	
func attack(homing: bool, attackDelay):
	await get_tree().create_timer(attackDelay).timeout
	var projectile = bulletProjectile.instantiate()
	
	#$model/rightHand.look_at(-player.global_position, Vector3.UP)
	#player.global_po
	if(homing):
		projectile.projectileColor = Color.BLUE
		add_child(projectile)
		projectile.global_position = $model/rightHand.global_position
		projectile.homingBullet=true
	else:
		projectile.projectileColor = Color.RED
		add_child(projectile)
		projectile.global_position = $model/rightHand.global_position
		projectile.homingBullet=false
	projectile.global_transform.basis.z = global_transform.basis.z

func _physics_process(delta):
	look_at(player.global_position)
	#$model/rightHand.look_at(-player.global_position, Vector3.UP)


func energySpinShow():
	$AnimationPlayer1.play("energyShow")
	$AnimationPlayer2.play("spin")

func energySpinHide():
	$AnimationPlayer1.play("energyHide")
	await $AnimationPlayer1.animation_finished
	$AnimationPlayer2.stop()


# This plays when the boss is hit, it stops the boss's current attack
func hitReset(): 
	$AnimationPlayer1.play("RESET")
	var tween = get_tree().create_tween()
	tween.tween_property($model/rightHand, "position", Vector3(-0.8,0,0), 0.2)
	
func laserShotStart():
	var tween = get_tree().create_tween()
	tween.tween_property($model/rightHand, "position", Vector3(-0.5,0,1), 0.6)
	#await get_tree().create_timer(laserAttackLength).timeout
func laserShotStop():
	var tween = get_tree().create_tween()
	tween.tween_property($model/rightHand, "position", Vector3(-0.8,0,0), 0.3)

#func _on_attack_cooldown_timeout() -> void:
	#var projectile = bulletProjectile.instantiate()
	#projectile.projectileColor = Color.BLUE
	#add_child(projectile)
	#projectile.homingBullet=true
	#
	#projectile.global_position = $model/rightHand.global_position
	#await get_tree().create_timer(0.5).timeout
	#projectile = bulletProjectile.instantiate()
	#projectile.projectileColor = Color.RED
	#add_child(projectile)
	#projectile.homingBullet=false
	#
	#projectile.global_position = $model/rightHand.global_position
