extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	apply_central_impulse(Vector2(-2000, 0))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
