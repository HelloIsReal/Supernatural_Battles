extends "res://Scenes/enemy.gd"

const laserAttackLength = 3
@onready var bulletProjectile = preload("res://Scripts/enemy_projectile.tscn")


func _ready() -> void:
	super() # allows the extended script to finish initializing first
	print("firstBoss script extended ok!")	
	energySpinShow()
	await get_tree().create_timer(3).timeout
	energySpinHide()
	await get_tree().create_timer(1).timeout
	laserShot()


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
	
func laserShot():
	var tween = get_tree().create_tween()
	tween.tween_property($model/rightHand, "position", Vector3(-0.5,0,1), 0.6)
	await get_tree().create_timer(laserAttackLength).timeout
	tween = get_tree().create_tween()
	tween.tween_property($model/rightHand, "position", Vector3(-0.8,0,0), 0.3)

func _on_attack_cooldown_timeout() -> void:
	var projectile = bulletProjectile.instantiate()
	#projectile.homing = true
	add_child(projectile)
