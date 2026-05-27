extends MultiMeshInstance3D

@export var object_count: int = 100000
var my_material = StandardMaterial3D.new()

func _ready():
	# 1. Initialize the MultiMesh resource
	multimesh = MultiMesh.new()
	multimesh.transform_format = MultiMesh.TRANSFORM_3D
	multimesh.instance_count = object_count
	
	# 2. Assign the mesh you want to duplicate
	multimesh.mesh = preload("res://straw.obj")
	multimesh.material_override = my_material
	#multimesh.surface_set_material(0,"res://grassShader.tres")
	
	# 3. Populate all instances using a fast loop
	var spacing = 2.0
	for i in range(object_count):
		# Calculate coordinates to grid them out
		var x = (i % 300) * spacing
		var z = (i / 300) * spacing
		var y = sin(x * 0.1)  # Create a wave pattern
		
		var transform = Transform3D()
		transform.origin = Vector3(x, y, z)
		
		# 4. Apply the transform to the specific instance
		multimesh.set_instance_transform(i, transform)
