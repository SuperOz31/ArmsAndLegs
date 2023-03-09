extends KinematicBody2D

const ACCELERATION = 300
const MAX_SPEED = 200
const FRICTION = 100
const GRAVITY = 300

var velocity = Vector2.ZERO

func _physics_process(delta):
	$CollisionShape2D2.look_at(get_global_mouse_position()) 
	$CollisionShape2D2.rotation_degrees += 90
	
	if velocity.x < 0:
		if $CollisionShape2D2/Sprite2.flip_h == true:
			$CollisionShape2D2/Sprite2.flip_h = false

	if velocity.x > 0:
		if $CollisionShape2D2/Sprite2.flip_h == false:
			$CollisionShape2D2/Sprite2.flip_h = true
			
	
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("d_right") - Input.get_action_strength("a_left")
	input_vector.y = Input.get_action_strength("s_down") - Input.get_action_strength("w_up")
	input_vector = input_vector.normalized()
	
	# GRAVITY
	velocity.y += GRAVITY * delta
	
	if input_vector != Vector2.ZERO:
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
		
	velocity = move_and_slide(velocity)
	
	# If head collides, restart scene

		
		# TRANSITION TO MAIN MENU
	if Input.get_action_strength("ui_right"):
		SceneTransition.change_scene("res://title_screen/TitleScreenV2.tscn")


func _on_Head_tree_entered():
	print("You are dead")
