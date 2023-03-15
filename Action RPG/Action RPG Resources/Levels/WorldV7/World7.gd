extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var PointVector 
var ZoomAcceleration = 0

var zoomOut = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	
	#PointVector = Vector2($ShadowAttackerV2.get_global_mouse_position())
	# Point sprite towards playerv5
	PointVector = $PlayerV5.position
	#$ShadowAttackerV2.look_at(PointVector)
	#$ShadowAttackerV2.rotation_degrees += 50
	
	
	if Input.is_mouse_button_pressed( 1 ):
		$PlayerV5.rotation += .04
		ZoomAcceleration += .05
		$PlayerV5.scale.x += ZoomAcceleration * 2
		$PlayerV5.scale.y += ZoomAcceleration * 2
		$PlayerV5/Camera2D.zoom.x += ZoomAcceleration
		$PlayerV5/Camera2D.zoom.y += ZoomAcceleration
	elif ZoomAcceleration > 0:
		$PlayerV5.rotation += .04
		$PlayerV5.scale.x -=  ZoomAcceleration * 4
		$PlayerV5.scale.y -=  ZoomAcceleration * 4
		$PlayerV5/Camera2D.zoom.x -= ZoomAcceleration
		$PlayerV5/Camera2D.zoom.y -= ZoomAcceleration
