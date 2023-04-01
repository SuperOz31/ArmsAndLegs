extends KinematicBody2D

var velocity
var speed = 5

var PlayerPosition = Vector2(70,70)

func _physics_process(delta):
	var direction = PlayerPosition - position
	direction = direction.normalized()
	var velocity = direction * speed
	move_and_slide(velocity)

