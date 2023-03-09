extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


var IncreaseBrightness = false
var randomNum
var rng = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.
func flicker():
	
	if $Light2D.energy > .5:
		IncreaseBrightness = false
	if $Light2D.energy < .00:
		IncreaseBrightness = true
	
	if IncreaseBrightness == false:
		$Light2D.energy -= .02
	if IncreaseBrightness == true:
		$Light2D.energy += .02
	
func randomFlicker():
	randomNum = rng.randf_range(-10.0, 10.0)
	if randomNum >= 9:
		$Light2D.energy = 0.01
	if randomNum >= 8:
		$Light2D.energy = 1.5/2
		$Light2D.texture_scale = randomNum/10
	
func _process(delta):
	# Randomize the brigthness to make it appear to flicker
	randomFlicker()

