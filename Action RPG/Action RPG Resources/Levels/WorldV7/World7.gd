extends Node2D

var PointVector 
var ZoomAcceleration = 0

var zoomOut = true

func disable_limits():
		$Camera2D.limit_left = -100000000000
		$Camera2D.limit_top = -100000000000
		$Camera2D.limit_right = 100000000000
		$Camera2D.limit_bottom = 100000000000

func _process(delta):
	
	#PointVector = Vector2($ShadowAttackerV2.get_global_mouse_position())
	# Point sprite towards playerv5
	PointVector = $PlayerV5.position
	#$ShadowAttackerV2.look_at(PointVector)
	#$ShadowAttackerV2.rotation_degrees += 50
	

	if Input.is_mouse_button_pressed( 1 ):
		disable_limits()
		$PlayerV5.rotation += .04
		ZoomAcceleration += .05
		$PlayerV5.scale.x += ZoomAcceleration * 2
		$PlayerV5.scale.y += ZoomAcceleration * 2
		$Camera2D.zoom.x += ZoomAcceleration
		$Camera2D.zoom.y += ZoomAcceleration
	elif ZoomAcceleration > 0:
		$PlayerV5.rotation += .04
		$PlayerV5.scale.x -=  ZoomAcceleration * 4
		$PlayerV5.scale.y -=  ZoomAcceleration * 4
		$Camera2D.zoom.x -= ZoomAcceleration
		$Camera2D.zoom.y -= ZoomAcceleration
