extends KinematicBody2D

const ACCELERATION = 200
const MAX_SPEED = 60
const FRICTION = 200
const GRAVITY = 300

var velocity = Vector2.ZERO

onready var animationPlayer = $AnimationPlayer

var ArmOrigin 
const ArmSpeed = 5


func _physics_process(delta):
	ArmOrigin = Vector2(position.x + 10, position.y - 10)
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("d_right") - Input.get_action_strength("a_left")
	input_vector.y = Input.get_action_strength("s_down") - Input.get_action_strength("w_up")
	input_vector = input_vector.normalized()

	
	
		
	# GRAVITY
	#velocity.y += GRAVITY * delta
	
	# VELOCITY
	if input_vector != Vector2.ZERO:
		animationPlayer.play("RunRight")
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else:
		animationPlayer.play("IdleRight")
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
		
	velocity = move_and_slide(velocity)
	
		# TRANSITION TO TITLE SCREEN
	if Input.get_action_strength("ui_right"):
		SceneTransition.return_to_title_screen()
