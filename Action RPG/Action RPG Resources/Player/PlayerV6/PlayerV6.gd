extends KinematicBody2D

const MAX_SPEED = 30
const RUN_SPEED = 1.75
var velocity = Vector2.ZERO
var speedModifier
var horizontalTilt = 0 # skews player movement horizonally
var verticalTilt = 0 # skews player movement vertically

onready var animationPlayer = $AnimationPlayer


func _physics_process(delta):
	pass
	
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("d_right") - Input.get_action_strength("a_left") + horizontalTilt
	input_vector.y = Input.get_action_strength("s_down") - Input.get_action_strength("w_up") + verticalTilt
	input_vector = input_vector.normalized()
	
	if Input.get_action_strength("emphasize") != 0:
		speedModifier = RUN_SPEED
	else:
		speedModifier = 1
	# VELOCITY
	if input_vector != Vector2.ZERO:
		animationPlayer.play("RunRight")
		velocity = input_vector * MAX_SPEED * speedModifier
	else:
		animationPlayer.play("IdleRight")
		velocity = Vector2.ZERO
	
	velocity = move_and_slide(velocity)

	# TRANSITION TO TITLE SCREEN
	if Input.get_action_strength("ui_right"):
		SceneTransition.return_to_title_screen()
