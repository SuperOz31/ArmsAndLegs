extends Node2D


func _process(delta):
	
	if Input.is_mouse_button_pressed( 1 ):
		$KinematicBody2D.global_position = $KinematicBody2D.global_position.move_toward(get_viewport().get_mouse_position(), 1)
		print(get_viewport().get_mouse_position())
	else:
		$KinematicBody2D.global_position = $KinematicBody2D.global_position.move_toward(Vector2.ZERO, 1)
	
