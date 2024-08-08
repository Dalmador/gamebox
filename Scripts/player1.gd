extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -500.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var isJumping = false
var shootCooldown = 0


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	
	if Input.is_key_pressed(KEY_L) and can_shoot(delta):
		shoot()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if Input.get_axis("ui_up", "ui_down"):
		if not isJumping:
			velocity.y += JUMP_VELOCITY
			isJumping = true
		velocity.y -= 700. * delta
	if velocity.y == 0:
		isJumping = false;

	move_and_slide()
	
func shoot():
	var bulletScene = preload("res://Scenes/SheepShot/bullet.tscn")
	var inst = bulletScene.instantiate()
	inst.position = position - Vector2(20, -3)
	add_sibling(inst)
	
func can_shoot(delta):
	if shootCooldown > 0:
		shootCooldown -= delta
		return false
	else:
		shootCooldown = 0.1
		return true
