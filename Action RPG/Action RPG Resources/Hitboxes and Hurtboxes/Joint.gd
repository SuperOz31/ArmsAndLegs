extends Node2D

func _process(delta):

	if Input.is_mouse_button_pressed(1):
		#ALWAYS FACE MOUSE CURSOR
		look_at(get_global_mouse_position())
		
		#change this later 

	if Input.is_mouse_button_pressed(2):
		#ALWAYS FACE MOUSE CURSOR
		
		$Forearm.look_at(get_global_mouse_position())
		$Forearm.rotation_degrees += -90
		
		#change this later 
