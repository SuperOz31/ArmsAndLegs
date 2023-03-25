extends Node2D

# Set up the initial variables
var currentLocation1 = Vector2.ZERO
var targetLocation1
var speed1 = 0.1  # Adjust this to control the speed of movement


var currentLocation2 = Vector2.ZERO
var targetLocation2
var speed2 = 1 # Adjust this to control the speed of movement

func _process(delta):
	
	
	if !Input.is_mouse_button_pressed(1):
		var targetLocation1 = get_global_mouse_position()
		# Calculate the new location using lerp
		currentLocation1 = currentLocation1.linear_interpolate(targetLocation1, speed1)
		look_at(currentLocation1)

		var targetLocation2 = get_global_mouse_position()
		# Calculate the new location using lerp
		currentLocation2 = currentLocation2.linear_interpolate(targetLocation2, speed2)
		# Do something with the current location, such as move a sprite	
		#$Forearm.rotation_degrees = 0
		$Forearm.look_at(currentLocation2)
		$Forearm.rotation_degrees += 270
		
	else:
		pass
		# Bend arm 90 degrees to face cursor, default is at right angle
# 	$Forearm.rotation is similiar to a wind up toy. This would be really funny for a pixxle

# Create a function that extends the arm for a jab fast.
