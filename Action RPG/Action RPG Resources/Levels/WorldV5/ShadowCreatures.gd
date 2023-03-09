extends Node2D
var PointVector

var HandSpeed = 10
var velocity = .2

var sound = preload("res://Action RPG/Action RPG Resources/Levels/WorldV6/Wendigo sounds.mp3")


# Called when the node enters the scene tree for the first time.
func _ready():
	$SoundInstance.stream = sound
	
	add_child($soundInstance)
	$SoundInstance.playing = true



func _process(delta):
	
	PointVector = Vector2($ShadowAttacker.get_global_mouse_position())
	# Point sprite towards playerv5
	PointVector = $PlayerV5.position
	$ShadowAttacker.look_at(PointVector)
	$ShadowAttacker.rotation_degrees += 50
	
	if $PlayerV5.scareCreatures == true:
		#$ShadowAttacker.position.move_toward(10,10,10)
		HandSpeed += velocity
		$ShadowAttacker.position = $ShadowAttacker.position.move_toward($PlayerV5.position, -HandSpeed * delta)
	else:
		$ShadowAttacker.position = $ShadowAttacker.position.move_toward($PlayerV5.position, HandSpeed * delta)
		HandSpeed += velocity

	# Check if the light is flashing (you will need to replace "Input.is_action_pressed" with your own input check)
	if Input.is_action_pressed("space"):
		# Stop the sound if the light is flashing
		$SoundInstance.stop()
	else:
		# Resume playing the sound if the light is not flashing
		$SoundInstance.play()


