extends KinematicBody2D

const SPEED = 10

var velocity
var collision

func _process(delta):
	velocity = Vector2(15,0)
	
	collision = move_and_collide(velocity * delta)
	print(collision)
	if collision:
		print("DEATH SCREEN BOOLEAN!")
		#collision.collider.get_node("Label").visible=true

