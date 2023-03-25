extends Position2D


func _process(delta):

	
	if Input.is_mouse_button_pressed(2):
		#ALWAYS FACE MOUSE CURSOR
		look_at(get_global_mouse_position())
		
		#change this later 
		rotation_degrees += -90

# IDEAS

# The arm will interact with the environment
# The arm will also hold a stick for increased range
# The arm can be shoved towards and enemy as a form of attack
# The arm will transform with the player, this will need alot of editing in the animation tab.
#	The arm will have to either rotate or mirror. If not those, then change X and Y to the certain spot on the elbow

# For when the mouse isnt being used or clicker, reset the arm to an idle animation. 
# Either animate the arm returning like a normal arm or have luke animate something similiar


# For the arm joint, instead of having two seperate mouse buttons, just have the forarm joint adjust to the base one. Use lerp.
