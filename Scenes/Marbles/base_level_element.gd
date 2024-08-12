extends Node3D

var inside = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_3d_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	self.inside += 1

func _on_area_3d_body_shape_exited(body_rid, body, body_shape_index, local_shape_index):
	self.inside -= 1
	if self.inside == 0:
		move() 

func move():
	self.transform.origin += 3 * Vector3(47.1, -17.5, 0)
