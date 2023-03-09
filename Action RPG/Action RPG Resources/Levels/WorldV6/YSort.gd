extends YSort


var PointVector

var HandSpeed = 1
var velocity = .1

var vector1 = Vector2(100,100)
var randomGen = RandomNumberGenerator.new()

# Recharge Bar Settings
const FILL_MULTIPLIER = .10 # Time it takes to fill the progress bar completely
var fill_speed # Speed at which the progress bar fills, in units per second


func ShadowCreatureNoises():
	$SoundPlayer.play()

func _ready():
	#Recharge Bar
	fill_speed = 1.0 / FILL_MULTIPLIER # Calculate the fill speed based on the fill time
	ShadowCreatureNoises()


func display_text(text: String):
	var text_label = Label.new()
	text_label.text = text
	text_label.rect_size = Vector2(100, 100)
	add_child(text_label)
	
	#var fade = FadeOut.new()
	#fade.duration = 1.0
	#text_label.add_child(fade)

func _process(delta):
	#RECHARGE BAR
	rechargeBar(delta)
	
	
	#MONSTER VOLUME
	var distance = $ShadowAttacker.position.distance_to($PlayerV5.position)
	var volume = (10.0 - distance/4)
	$SoundPlayer.volume_db = volume


	PointVector = Vector2($ShadowAttacker.get_global_mouse_position())
	# Point sprite towards playerv5
	PointVector = $PlayerV5.position
	$ShadowAttacker.look_at(PointVector)
	$ShadowAttacker.rotation_degrees += 50
	var randomNumber = randomGen.randf_range(-0.6, 0.5)
	
	if $PlayerV5.scareCreatures == true:
		# Add variation to velocity
		HandSpeed += velocity
		HandSpeed += randomNumber 
		$ShadowAttacker.position = $ShadowAttacker.position.move_toward($PlayerV5.position, -HandSpeed * delta)
	else:
		$ShadowAttacker.position = $ShadowAttacker.position.move_toward($PlayerV5.position, HandSpeed * delta)
		HandSpeed += velocity

	if $ShadowAttacker.position.x > 200 or $ShadowAttacker.position.x < -200:
		$ShadowAttacker.position.x = -$ShadowAttacker.position.x
	if $ShadowAttacker.position.y > 200 or $ShadowAttacker.position.y < -200:
		$ShadowAttacker.position.y = -$ShadowAttacker.position.y
		
	if Input.get_action_strength("ui_up"):
		reset()
		
func rechargeBar(delta):
	if Input.is_action_pressed("ui_accept"):
		print($RechargeFlashBar.value)
		$RechargeFlashBar.value += fill_speed * delta # Increase the value based on the time elapsed since the previous frame
	else:
		$RechargeFlashBar.value -= fill_speed * delta * 10
		
		
	if $RechargeFlashBar.value >= 100:
		# Increase flashes by 1
		$RechargeFlashBar.value = 0
		$PlayerV5.flashesRemaining += 1
		$PlayerV5/Label.text = str($PlayerV5.flashesRemaining)


func reset():
	$PlayerV5.position.x = 40
	$PlayerV5.position.y = 40
	
	HandSpeed = 2
	$ShadowAttacker.position.x = 100
	$ShadowAttacker.position.y = 100
