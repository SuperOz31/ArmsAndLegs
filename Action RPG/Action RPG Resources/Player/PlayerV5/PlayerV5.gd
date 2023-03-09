extends KinematicBody2D

const ACCELERATION = 200
const MAX_SPEED = 60
const FRICTION = 200
var velocity = Vector2.ZERO


onready var animationPlayer = $AnimationPlayer

var ArmOrigin 
const ArmSpeed = 5

onready var light = get_node("Light2D")
var maxBrightness = 1.0
var fadeTime = 5.0
var isFading = false
var fadeStartTime = 0.0


const DELAY_TIME = 5.0

var light_node: Light2D
var fading: bool = false
var fade_start_time: float
var last_flashlight_time: float = -DELAY_TIME
var MAX_BRIGHTNESS = 4.0
var FADE_TIME = 1.0


export var scareCreatures = false
var scareDuration = 3.0

const flashLimit = 3
var flashesRemaining = flashLimit
var lastFlashlightTime = -1.0 # For click1.mp3

# For Color Rectangle Spawning
const SPAWN_INTERVAL = 1000
var spawnTimer = 0.0
onready var colorRect = preload("res://Action RPG/Action RPG Resources/Levels/WorldV6/Blood.tscn")

var startTime = 0.0

func _ready():
	$TextureProgress.value = 100
	
	startTime = OS.get_ticks_usec() / 1000000.0
	updateTimer()


func updateTimer():
	var currentTime = OS.get_ticks_usec() / 1000000.0 - startTime
	$TimeLabel.text = "Time: " + str(currentTime)
	$TimeLabel.text = "%.1f" % currentTime
func Dio():
	if Input.is_mouse_button_pressed(2):
		if Input.is_mouse_button_pressed(1):
			$Light2D.energy += 10
			$Light2D.texture_scale += .01
			$Light2D.rotation += 199
		else:
			$Light2D.energy -= 10
			$Light2D.texture_scale -= .01
			$Light2D.rotation -= .1
	else:
		$Light2D.energy = .3
		$Light2D.texture_scale = 1.0


func flashlight():
	if Input.is_action_just_pressed("ui_accept") and not isFading and flashesRemaining > 0:
		flashesRemaining -= 1
		$Label.text = str(flashesRemaining)
		light.energy = maxBrightness
		isFading = true
		fadeStartTime = OS.get_ticks_usec() / 1000000.0
		$CamAudio.play()
		scareCreatures = true
		lastFlashlightTime = OS.get_ticks_usec() / 1000000.0
	if fading:
		var elapsed_time = OS.get_ticks_usec() / 1000000.0 - fade_start_time
		var t = elapsed_time / FADE_TIME
		$Light2D.energy = MAX_BRIGHTNESS * (1.0 - t)
		if t >= 1.0:
			$Light2D.energy = 0.0
			fading = false
			
	if $Light2D.energy > 0.0:
		fading = true

func rectangleSpawn(delta):
	spawnTimer += delta
	if spawnTimer >= SPAWN_INTERVAL:
		spawnTimer = 0.0
		
		var newColorRect = colorRect.instance()
		newColorRect.color = Color.red
		newColorRect.rect_size = Vector2(1, 1)
		newColorRect.rect_position = position
		
		get_parent().add_child(newColorRect)


func _physics_process(delta):
	updateTimer()
	flashlight()
	rectangleSpawn(delta)
	
	
	if isFading:
		var elapsedTime = OS.get_ticks_usec() / 1000000.0 - fadeStartTime
		var t = elapsedTime / fadeTime
		if flashesRemaining < 1:
			$TextureProgress.value = 0
		else:
			$TextureProgress.value = t*100
		light.energy = maxBrightness * (1.0 - t)
		if t >= 1.0:
			light.energy = 0.0
			isFading = false
	if scareCreatures:
		scareDuration -= delta
		if scareDuration <= 0:
			scareCreatures= false
			scareDuration = 3.0
	
	
	ArmOrigin = Vector2(position.x + 10, position.y - 10)
	
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("d_right") - Input.get_action_strength("a_left")
	input_vector.y = Input.get_action_strength("s_down") - Input.get_action_strength("w_up")
	input_vector = input_vector.normalized()
	
	# VELOCITY
	if input_vector != Vector2.ZERO:
		animationPlayer.play("RunRight")
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else:
		animationPlayer.play("IdleRight")
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	
	velocity = move_and_slide(velocity)

	# TRANSITION TO TITLE SCREEN
	if Input.get_action_strength("ui_right"):
		SceneTransition.return_to_title_screen()
