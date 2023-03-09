extends KinematicBody2D

const ACCELERATION = 200
const MAX_SPEED = 60
const FRICTION = 200
const GRAVITY = 300

var velocity = Vector2.ZERO

var ArmOrigin 
const ArmSpeed = 2

func MoveArmToCursor():
	if $RArmV2.global_position == get_viewport().get_mouse_position():
		pass
	else:
		$RArmV2.global_position = $RArmV2.global_position.move_toward(get_viewport().get_mouse_position(), ArmSpeed)

func MoveArmToOrigin():
	# MOVE TO THE OLD ORIGIN INITIALLY ASSINGED BY SCENE
	$RArmV2.global_position = $RArmV2.global_position.move_toward(ArmOrigin, ArmSpeed)


func _physics_process(delta):
	ArmOrigin = Vector2(position.x/2 +5, position.y/2 - 5)
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("d_right") - Input.get_action_strength("a_left")
	input_vector.y = Input.get_action_strength("s_down") - Input.get_action_strength("w_up")
	input_vector = input_vector.normalized()
	
	if Input.is_mouse_button_pressed( 1 ):
		MoveArmToCursor()
	else:
		MoveArmToOrigin()


	if Input.is_mouse_button_pressed( 2 ):
		# MOVE TOWARD MOUSE
		if $RArmV2.global_position == get_viewport().get_mouse_position():
			pass
		else:
			$RArmV2.look_at(get_global_mouse_position()) 
			$RArmV2.rotation_degrees += -90
	

	
	
		
	# GRAVITY
	#velocity.y += GRAVITY * delta
	
	# VELOCITY
	if input_vector != Vector2.ZERO:
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
		
	velocity = move_and_slide(velocity)
	
		# TRANSITION TO TITLE SCREEN
	if Input.get_action_strength("ui_right"):
		SceneTransition.return_to_title_screen()
