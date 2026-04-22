extends Node3D

func _ready():
	$"../Viewport2Din3D".visible = false


# add a transition for making it appear from the speaker, and vice versa.
func _on_body_entered(body):
	print("body:",body)
	if($"../Viewport2Din3D".visible): # turns the speaker menu on and off
		$"../Viewport2Din3D".visible = false
	else:
		$"../Viewport2Din3D".visible = true
		


func _on_area_entered(area):
	print("area:",area)
	if($"../Viewport2Din3D".visible): # turns the speaker menu on and off
		$"../Viewport2Din3D".visible = false
	else:
		$"../Viewport2Din3D".visible = true
