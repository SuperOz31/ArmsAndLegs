extends CanvasLayer

var PointVector 

func _ready():
	pass


func _process(delta):
	# Point sprite towards mouse position
	PointVector = Vector2($Sprite3.get_global_mouse_position())
	# Point sprite towards playerv4
	PointVector = $PlayerV4.position
	$Sprite3.look_at(PointVector)
	$Sprite3.rotation_degrees += 50
	#$HandAttacker1.look_at(PointVector)
	#$HandAttacker1.rotation_degrees += 50
	
	$Sprite5.look_at(PointVector)
	$Sprite5.rotation_degrees += 50
	
	$Sprite6.look_at(PointVector)
	$Sprite6.rotation_degrees += 50

	
	if Input.is_mouse_button_pressed( 1 ):
		$AnimationPlayer.play("HandAttack2")
		yield($AnimationPlayer, "animation_finished")
		$AnimationPlayer.play_backwards("HandAttack2")
