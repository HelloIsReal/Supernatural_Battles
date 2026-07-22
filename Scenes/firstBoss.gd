extends "res://Scenes/enemy.gd"

const laserAttackLength = 3
@onready var bulletProjectile = preload("res://Scripts/enemy_projectile.tscn")
@onready var player = get_tree().get_first_node_in_group("player")

var lookingAtPlayer = true


func _ready() -> void:
	super() # allows the extended script to finish initializing first
	await get_tree().create_timer(3).timeout
	energySpinShow()
	await get_tree().create_timer(2).timeout
	$firstAttackVoice.play()
	#await $firstAttackVoice.finished
	energySpinHide()
	await get_tree().create_timer(1).timeout
	laserShotStart()
	
	#await get_tree().create_timer(1).timeout
	#laserShotStop()
	
func attack(attackType: int, attackDelay):
	await get_tree().create_timer(attackDelay).timeout
	var projectile = bulletProjectile.instantiate()
	
	#$model/rightHand.look_at(-player.global_position, Vector3.UP)
	#player.global_po
	#projectile.add_collision_exception_with(self)
	
	projectile.global_position = $model/rightHand.global_position
	if (attackType==1):
		projectile.projectileColor = Color.BLUE
		projectile.attackType=1
	elif (attackType==2):
		projectile.projectileColor = Color.RED
		projectile.attackType=2
	elif (attackType==3):
		#insert attack shoots bullets all around the boss.
		projectile.projectileColor = Color.RED
		projectile.attackType=3
		projectile.rotation.y = rotation.y
	get_tree().current_scene.add_child(projectile)
			
	#projectile.global_transform.basis.z = global_transform.basis.z

func _physics_process(_delta):
	if(lookingAtPlayer):
		look_at(player.global_position, Vector3(0,1,0))
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
	await tween.finished
	lookingAtPlayer=true
	attack(2,0.2)
	attack(1,0.4)
	await get_tree().create_timer(3).timeout
	attack(1,1)
	attack(1,1.4)
	attack(1,1.8)
	attack(1,2.2)
	tween = get_tree().create_tween()
	tween.tween_property($model/rightHand, "position", Vector3(-0.8,0,0), 0.3)
	lookingAtPlayer = false
	await get_tree().create_timer(2).timeout
	spinAttack()

func spinAttack():
	lookingAtPlayer = false
	var count=0
	for i in range(12):
		attack(3,0.5*i)
		rotation.y = count * 30
		print("count: ", count,". rotation: ",rotation.y)
		count = count + 1
	
	#attack(2,0.6)
	#attack(1,0.8)

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
