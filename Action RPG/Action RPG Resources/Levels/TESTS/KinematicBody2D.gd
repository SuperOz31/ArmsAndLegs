extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var destination = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _process(delta):
	position = Vector2(0, 0)
	destination = Vector2(10,10)
	position = position.move_toward(destination, 1)
