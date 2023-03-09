extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	print("This file is ready")


func _process(delta):
	var my_random_number = rng.randf_range(-10.0, 10.0)
	position.x += my_random_number



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
