extends KinematicBody2D

const ACCELERATION = 200
const MAX_SPEED = 60
const FRICTION = 200
const GRAVITY = 300

var velocity = Vector2.ZERO

func _physics_process(delta):
	
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("d_right") - Input.get_action_strength("a_left")
	input_vector.y = Input.get_action_strength("s_down") - Input.get_action_strength("w_up")
	input_vector = input_vector.normalized()
	
	if Input.is_mouse_button_pressed( 1 ):
		$LArm.look_at(get_global_mouse_position()) 
		$LArm.rotation_degrees += -90
	if Input.is_mouse_button_pressed( 2 ):
		print("MOVE TOWARD MOUSE")
		$RArm.look_at(get_global_mouse_position()) 
		$RArm.rotation_degrees += -90
	# GRAVITY
	#velocity.y += GRAVITY * delta
	
	if input_vector != Vector2.ZERO:
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
		
	velocity = move_and_slide(velocity)
	
		# TRANSITION TO TITLE SCREEN
	if Input.get_action_strength("ui_right"):
		SceneTransition.return_to_title_screen()
