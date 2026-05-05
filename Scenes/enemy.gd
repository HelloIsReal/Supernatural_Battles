extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5

var enemyHealth = 10

func _ready() -> void:
	# used to check if this enemy has loaded. Mainly for inherited scenes.
	print($".".name," loaded!")

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	#var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	#var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	#if direction:
		#velocity.x = direction.x * SPEED
		#velocity.z = direction.z * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
		#velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()


func _on_area_3d_body_entered(body):
	print(body.get_groups())


func _on_area_3d_area_entered(area):
	if area.is_in_group("playerAttack") and $invincibilityCooldown.is_stopped():
		$invincibilityCooldown.start()
		enemyHealth = enemyHealth - Globals.swordDamage
		print("ouch")
	$Label3D.text = "Health: %.1f" % enemyHealth
	if enemyHealth <= 0:
		queue_free()
		print("enemy dead")
	#print_debug("area ",area.get_tree().get_nodes_in_group("playerAttack"))
