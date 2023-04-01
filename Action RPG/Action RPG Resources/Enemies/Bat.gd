extends KinematicBody2D

var knockback = Vector2.ZERO

var last_mouse_pos = Vector2.ZERO

var StrongHitLimit = 300
var WeakHitLimit = 100

var mouse_speed = Vector2.ZERO

func _physics_process(delta):

	var mouse_pos = get_viewport().get_mouse_position()
	mouse_speed = (mouse_pos - last_mouse_pos) / delta
	last_mouse_pos = mouse_pos
	
	knockback = knockback.move_toward(Vector2.ZERO, 200 * delta)
	knockback = move_and_slide(knockback)
	
	#print(mouse_speed)

func _on_Hurtbox_area_entered(area):
	knockback = Vector2.RIGHT * 70
	#var knockback_vector = area.knockback_vector
	
	
	
	
	
	# STRONG HIT!
	# X Velocity
	if mouse_speed.x > StrongHitLimit or mouse_speed.x < -StrongHitLimit:
		print("STRONG HIT X")
		#position.x += 10
		queue_free()
	# Y Velocity
	elif mouse_speed.y > StrongHitLimit or mouse_speed.y < -StrongHitLimit:
		print("STRONG HIT Y")
		#position.y += 10
	# WEAK HIT!
	# X VELOCITY
	elif mouse_speed.x > WeakHitLimit or mouse_speed.x < -WeakHitLimit:
		print("WEAK HIT X")
		#position.x += 4
	# Y Velocity
	elif mouse_speed.y > WeakHitLimit or mouse_speed.y < -WeakHitLimit:
		print("WEAK HIT Y")
		#position.y += 4

	  #IF THE MOUSE CURSOR IS ANY OTHER LOW SPEED,
	  #INTERACT WITH THE OBJECT NORMALLY WITH MOVE AND SLIDE
