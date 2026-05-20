extends Node3D
#extends MultiMeshInstance3D

#func _ready():
	## Initialize the MultiMesh
	#multimesh = MultiMesh.new()
	#multimesh.transform_format = MultiMesh.TRANSFORM_3D
	#multimesh.mesh = preload("res://straw.obj") # Assign your mesh
	#
	## Set your desired limit (exceeding 65536)
	#var total_instances = 200000
	#multimesh.instance_count = total_instances
	#
	## Populate the instances
	#for i in range(total_instances):
		#var random_x = randf_range(-100.0, 100.0)
		#var random_z = randf_range(-100.0, 100.0)
		#
		#var transform = Transform3D()
		#transform.origin = Vector3(random_x, 0, random_z)
		#
		#multimesh.set_instance_transform(i, transform)
